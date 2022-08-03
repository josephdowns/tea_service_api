require 'rails_helper'

RSpec.describe "customers_subscriptions request", type: :request do
  before(:each) do
    @celes = Customer.create!({first_name: "Celes", last_name: "Chere", email: "celes@ffvi.com", address: "1234 Tzen", subscription: false})
    @tea = Subscription.create!({title: "More Tea, Please", price: 50, frequency: 30})
  end
  context "customer can create a subscription" do
    it "creates a relationship" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
        }
    
      body = {
      'customer_id': @celes.id,
      'subscription_id': @tea.id
      }
      post "/api/v1/subscriptions", headers: headers, params: JSON.generate(body)

      celes = Customer.last

      expect(celes.subscriptions.first.title).to eq("More Tea, Please")
      expect(celes.subscription).to be(true)
    end
  end
end