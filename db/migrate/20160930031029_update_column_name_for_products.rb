class UpdateColumnNameForProducts < ActiveRecord::Migration[5.0]
  def change
      rename_column :products, :end, :expire
  end
end
