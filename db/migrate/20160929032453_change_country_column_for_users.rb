class ChangeCountryColumnForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :country, 'integer USING CAST(country AS integer)'
  end
end
