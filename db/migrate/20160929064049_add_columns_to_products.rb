class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :name, :string
    add_column :products, :description, :text
    change_column :products, :price, 'float USING CAST(price AS float)'
    change_column :products, :status, 'integer USING CAST(status AS integer)'
  end
end
