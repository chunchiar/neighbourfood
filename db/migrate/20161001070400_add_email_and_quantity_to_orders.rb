class AddEmailAndQuantityToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :email, :string
    add_column :orders, :quantity, :integer
  end
end
