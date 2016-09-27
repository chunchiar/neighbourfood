class AddOtherDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :phone, :string
    add_column :users, :name, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :location, :string
    add_column :users, :address, :text
    add_column :users, :about, :text   
    add_column :users, :role, :integer
  end
end
