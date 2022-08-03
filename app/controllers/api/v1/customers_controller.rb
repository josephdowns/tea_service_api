class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.find_or_create_by(customer_params)
    render json: CustomerSerializer.new(customer), status: 201
  end

  def customer_params
    params.permit(:first_name, :last_name, :address, :email)
  end

end