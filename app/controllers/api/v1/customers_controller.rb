class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.find_or_create_by(customer_params)
    render json: CustomerSerializer.new(customer), status: 201
  end

  def update
  end

  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.show(customer)
  end

  def customer_params
    params.permit(:first_name, :last_name, :address, :email)
  end

  def index
    customers = Customer.all
    render json: CustomerSerializer.index(customers)
  end

end