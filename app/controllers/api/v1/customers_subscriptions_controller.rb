class Api::V1::CustomersSubscriptionsController < ApplicationController
  def create
    cs = CustomersSubscription.new(customers_subscriptions_params)
    if cs.save
      customer = Customer.find(params[:customer_id])
      customer.update_attribute(:subscription, true)
    end
  end

  def customers_subscriptions_params
    params.permit(:customer_id, :subscription_id)
  end
end