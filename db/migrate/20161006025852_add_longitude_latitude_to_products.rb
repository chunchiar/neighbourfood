class AddLongitudeLatitudeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :longitude, :float
    add_column :products, :latitude, :float
  end
end
