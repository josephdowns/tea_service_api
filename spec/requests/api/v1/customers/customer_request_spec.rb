require 'rails_helper'

RSpec.describe 'customers request', type: :request do
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

    expect(customer.first_name).to eq("Joseph")
    expect(customer.last_name).to eq("D")
    expect(customer.email).to eq("test@test.com")
    expect(customer.address).to eq("1234 St")
  end

  it "shows a customer and all subscriptions" do
    gau = Customer.create!({first_name: "Gau", last_name: "Lynx", email: "gau@ffvi.com", address: "1234 Mobliz", subscription: false})
    tea3 = Subscription.create!({title: "Tea, Tea, TEA!!", price: 100, frequency: 30})
    tea = Subscription.create!({title: "Try Tea", price: 30, frequency: 30})
    cs1 = CustomersSubscription.create!({customer_id: gau.id, subscription_id: tea3.id, status: 1})
    cs2 = CustomersSubscription.create!({customer_id: gau.id, subscription_id: tea.id, status: 1})

    get "/api/v1/customers/#{gau.id}"

    show = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(show).to have_key(:attributes)
    expect(show).to have_key(:subscriptions)
    expect(show[:subscriptions][:active].count).to eq(0)
    expect(show[:subscriptions][:canceled].count).to eq(2)
    
  end
end