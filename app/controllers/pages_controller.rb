class PagesController < ApplicationController

  def home
    @subscriptions = Subscription.all
    @animation = true
    # @animation = true if request.referer.include?("users/sign_in")
  end
end
