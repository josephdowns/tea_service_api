class CustomerSerializer
  def self.new(customer)
    {
      "data": {
        "type": "customers",
        "id": customer.id,
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address
        }
      }
    }
  end

  def self.show(customer)
    {
      "data": {
        "type": "customers",
        "id": customer.id,
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address
        },
        "subscriptions": {
          "active":
            customer.customers_subscriptions
            .joins(:subscription)
            .where(customers_subscriptions: { status: 0})
            .pluck('title'),
          "canceled":
            customer.customers_subscriptions
            .joins(:subscription)
            .where(customers_subscriptions: { status: 1})
            .pluck('title')
        }
      }
    }
  end
end