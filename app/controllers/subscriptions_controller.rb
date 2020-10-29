class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    if @subscription.save
      redirect_to subscriptions_path
    else
      render 'new'
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :category, :start_date, :end_date, :price, :periodicity, :commitment, :notice, :status)
  end

end
