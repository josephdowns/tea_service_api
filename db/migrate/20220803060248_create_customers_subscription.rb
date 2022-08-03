class CreateCustomersSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :subscription, foreign_key: true
      t.integer :status, default: 0
    end
  end
end
