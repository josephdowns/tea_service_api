class Subscription < ApplicationRecord
  belongs_to :customer

  validates_presence_of :title, :price, :status, :frequency

  enum status: {
    'Active' => 0,
    'Canceled' => 1,
    'Pending' => 2
  }
end
