class Customer < ApplicationRecord
  has_many :customers_subscriptions
  has_many :subscriptions, through: :customers_subscriptions

  validates_presence_of :first_name, :last_name, :address
  validates_uniqueness_of :email
end
