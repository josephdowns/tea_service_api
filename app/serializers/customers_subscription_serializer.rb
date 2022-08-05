class CustomersSubscriptionSerializer
  def self.new(cs)
    {
      "message": "Successfully subscribed!",
      "data": {
        "customer_id": cs.customer_id,
        "subscription_id": cs.subscription_id,
        "status": cs.status
      }
    }
  end

  def self.cancel(cs)
  {
    "message": "Successfully unsubscribed!",
    "data": {
      "customer_id": cs.customer_id,
      "subscription_id": cs.subscription_id,
      "status": cs.status
    }
  }
  end
end