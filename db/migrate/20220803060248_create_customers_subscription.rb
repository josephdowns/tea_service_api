class CreateCustomersSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_subscriptions do |t|
      t.references :customers, foreign_key: true
      t.references :subscriptions, foreign_key: true
    end
  end
end
