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
          "address": customer.address,
          "subscription": customer.subscription
        }
      }
    }
  end
end