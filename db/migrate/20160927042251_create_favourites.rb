class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.integer :keeper_id
      t.integer :fav_id

      t.timestamps
    end
  end
end
