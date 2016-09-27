class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.string :type
      t.integer :score

      t.timestamps
    end
  end
end
