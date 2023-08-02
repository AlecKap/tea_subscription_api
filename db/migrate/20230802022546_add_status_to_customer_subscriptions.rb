class AddStatusToCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :customer_subscriptions, :status, :string, default: 'active' 
  end
end
