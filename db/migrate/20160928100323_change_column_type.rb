class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change

    change_column :users, :longitude, 'float USING CAST(longitude AS float)'
    change_column :users, :latitude, 'float USING CAST(latitude AS float)'


    change_column :users, :address, :string
  end
end
