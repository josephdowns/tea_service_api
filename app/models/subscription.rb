class Subscription < ApplicationRecord
  has_many :customers, through: :customers_subscriptions

  validates_presence_of :title, :price, :frequency

end
