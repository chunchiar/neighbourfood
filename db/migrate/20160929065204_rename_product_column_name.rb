class RenameProductColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :start, :collect
  end
end
