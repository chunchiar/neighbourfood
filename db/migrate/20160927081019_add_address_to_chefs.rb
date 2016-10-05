class AddAddressToChefs < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :address, :string
  end
end
