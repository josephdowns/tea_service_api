class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :delete_all

  validates_presence_of :first_name, :last_name, :address
  validates_uniqueness_of :email
end
