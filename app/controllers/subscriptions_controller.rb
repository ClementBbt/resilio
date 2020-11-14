class SubscriptionsController < ApplicationController

  def index
    if params[:search] == "expired"
      @subscriptions = Subscription.where(status: "expire bientôt")
    else
      @subscriptions = Subscription.all
    end
  end

  def new
    @subscription = Subscription.new
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

  def show
    @subscription = Subscription.find(params[:id])
  end

  def resiliation
    @subscription = Subscription.find(params[:id])
    locals = {
      current_user: current_user,
      subscription: @subscription
    }
    # pdf_html = ActionController::Base.new.render_to_string(template: 'subscriptions/resiliation.html.erb', layout: 'pdf.html', locals: locals)
    # pdf = WickedPdf.new.pdf_from_string(pdf_html)
    # send_data pdf, filename: "resiliation_#{@subscription.id}.pdf"
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "resiliation_#{@subscription.id}",
          template: "subscriptions/resiliation.html.erb",
          layout: "pdf.html",
          locals: locals
        end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:visible, :name, :category, :start_date, :end_date, :price, :periodicity, :commitment, :notice, :status)
  end

end
