class CustomersSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  enum status: {
    "active" => 0,
    "canceled" => 1
  }
end