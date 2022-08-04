require 'rails_helper'

RSpec.describe "customers_subscriptions request", type: :request do
  before(:each) do
    @celes = Customer.create!({first_name: "Celes", last_name: "Chere", email: "celes@ffvi.com", address: "1234 Tzen"})
    @tea = Subscription.create!({title: "More Tea, Please", price: 50, frequency: 30})
  end
  context "customer can create a subscription" do
    it "creates a relationship" do
  
      post "/api/v1/customers/#{@celes.id}/subscriptions/#{@tea.id}/new"

      celes = Customer.last
      cs = CustomersSubscription.last

      expect(celes.subscriptions.first.title).to eq("More Tea, Please")
      expect(cs.customer_id).to eq(celes.id)
      expect(cs.subscription_id).to eq(@tea.id)

    end
  end

  context "customer can cancel a subscription" do
    it "cancels the subscription" do
      terra = Customer.create!({first_name: "Terra", last_name: "Branford", email: "terra@ffvi.com", address: "1234 Narshe"}) 
      CustomersSubscription.create!({customer_id: terra.id, subscription_id: @tea.id, status: 0 })

      patch "/api/v1/customers/#{terra.id}/subscriptions/#{@tea.id}/edit"

      new_cs = CustomersSubscription.last
      show = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(new_cs.status).to eq("canceled")
      expect(show[:subscriptions][:active].count).to be(0)
      expect(show[:subscriptions][:canceled].count).to be(1)
      
    end
  end
end