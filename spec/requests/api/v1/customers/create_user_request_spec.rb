require 'rails_helper'

RSpec.describe 'create_customers', type: :request do
  it 'creates a user' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
      }
  
      body = {
      'email': 'test@test.com',
      'first_name': 'Joseph',
      'last_name': 'D',
      'address': '1234 St'
      }

    post "/api/v1/customers", headers: headers, params: JSON.generate(body)

    customer = Customer.last
    customer_json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(customer.first_name).to eq("Joseph")
    expect(customer.last_name).to eq("D")
    expect(customer.email).to eq("test@test.com")
    expect(customer.address).to eq("1234 St")
  end
end