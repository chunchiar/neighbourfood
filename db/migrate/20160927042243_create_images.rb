class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :link

      t.timestamps
    end
  end
end
