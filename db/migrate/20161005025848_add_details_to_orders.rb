class AddDetailsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payment_id, :string
    add_column :orders, :order_status, :integer
    add_column :orders, :total_cost, :float
  end
end
