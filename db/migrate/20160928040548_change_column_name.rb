class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :image, :profile_image
  end
end
