class AddDefaultToStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :status, :integer, default: 0
  end
end
