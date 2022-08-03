class ChangeSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :status, :integer
    remove_column :subscriptions, :customer_id
  end
end
