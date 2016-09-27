class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :end
      t.integer :pax_total
      t.integer :pax_left
      t.string :location
      t.integer :price
      t.boolean :has_pork
      t.boolean :has_beef
      t.string :status

      t.timestamps
    end
  end
end
