class Api::V1::CustomersSubscriptionsController < ApplicationController
  def create
    cs = CustomersSubscription.create(customers_subscriptions_params)
    render json: CustomersSubscriptionSerializer.new(cs), status: 201
  end

  def update
    customer = Customer.find(params[:customer_id])
    cs = CustomersSubscription.find_by(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
    cs.update_attribute(:status, 1)
    render json: CustomersSubscriptionSerializer.cancel(cs)
  end

  def index
    cs = CustomersSubscription.where(customer_id: params[:customer_id])
  end

  def customers_subscriptions_params
    params.permit(:customer_id, :subscription_id)
  end
end