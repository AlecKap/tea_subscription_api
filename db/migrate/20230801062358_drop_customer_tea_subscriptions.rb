class DropCustomerTeaSubscriptions < ActiveRecord::Migration[7.0]
  def change
    drop_table :customer_tea_subscriptions
  end
end
