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

  private

  def subscription_params
    params.require(:subscription).permit(:visible, :name, :category, :start_date, :end_date, :price, :periodicity, :commitment, :notice, :status)
  end

end
