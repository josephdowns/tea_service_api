class Api::V1::SubscriptionsController < ApplicationController
  def index
    subs = Subscription.all
    render json: SubscriptionSerializer.index(subs)
  end
end