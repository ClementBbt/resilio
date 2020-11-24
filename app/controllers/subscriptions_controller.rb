class SubscriptionsController < ApplicationController

  def index
    if params[:search] == "expired"
      @subscriptions = Subscription.where(status: "expire bientôt")
    elsif params[:search] == "resiliation"
      @subscriptions = Subscription.where(status: "résiliation en cours")
    else
      @subscriptions = Subscription.all
    end
  end

  def new
    @subscription = Subscription.new
    transaction_id = params.to_unsafe_h[:transactions].sort.last.to_i
    @transaction = Transaction.find(transaction_id)
    #@transaction = Transaction.find(params[:transaction_id])
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    transactions = Transaction.where(title: @subscription.name)
    transactions.each do |transaction|
      transaction.update(subscription: @subscription)
    end
    if @subscription.save && @subscription.visible
      redirect_to subscriptions_path
    elsif @subscription.save
      redirect_to transactions_path, notice:"Transaction supprimée"
    else
      render 'new'
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end


  def show
    @subscription = Subscription.find(params[:id])
  end

  def resiliation
    @subscription = Subscription.find(params[:id])
    locals = {
      current_user: current_user,
      subscription: @subscription
    }
    pdf_html = ActionController::Base.new.render_to_string(template: 'subscriptions/resiliation.html.erb', layout: 'pdf.html', locals: locals)
    pdf = WickedPdf.new.pdf_from_string(pdf_html) #contenu que me donne wicket pdf


    pdf_path = Rails.root.join("tmp", "resiliation-#{@subscription.id}.pdf") #on crée le pdf (fichier temporaire)
    File.open(pdf_path, "wb") do |file|
    file << pdf #on met dans file le contenu donné par wicket pdf
    end

    url = send_to_docusign(pdf_path.to_s, @subscription)

    File.delete(pdf_path) if File.exist?(pdf_path) #on delete le pdf car heroku ne veut pas qu'on en stocke

    redirect_to url
    # send_data pdf, filename: "resiliation_#{@subscription.id}.pdf"

    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #       render pdf: "resiliation_#{@subscription.id}",
    #       template: "subscriptions/resiliation.html.erb",
    #       layout: "pdf.html",
    #       locals: locals
    #     end
    # end
  end


  def send_to_docusign(pdf_path, subscription)

    client = DocusignRest::Client.new
    document_envelope_response = client.create_envelope_from_document(
      email: {
        subject: "Resilio",
        body: "Signez votre lettre de résiliation"
      },
      # If embedded is set to true in the signers array below, emails
      # don't go out to the signers and you can embed the signature page in an
      # iframe by using the client.get_recipient_view method
      signers: [
      {
          embedded: true,
          routing_order: '1',
          name: "#{current_user.first_name} #{current_user.last_name}",
          email: current_user.email,
          role_name: 'issuer',
          sign_here_tabs: [
            {
              anchor_string: 'Signature',  #emplacement dans le pdf de la signature
              anchor_x_offset: '-35',
              anchor_y_offset: '35'
            }
          ]
        }
      ],
      files: [
        {path: pdf_path, name: "resiliation-#{subscription.id}.pdf"},
      ],
      status: 'sent'
    )

    enveloppe_id = document_envelope_response['envelopeId']

    url = client.get_recipient_view(envelope_id: enveloppe_id, name: "#{current_user.first_name} #{current_user.last_name}", email: current_user.email, return_url: "#{ENV['ROOT_URL']}/subscriptions?search=resiliation")['url']

    subscription.update(status: "résiliation en cours")

    return url

  end

  private

  def subscription_params
    params.require(:subscription).permit(:visible, :name, :category, :start_date, :end_date, :price, :periodicity, :commitment, :notice, :status, :alias)
  end

end
