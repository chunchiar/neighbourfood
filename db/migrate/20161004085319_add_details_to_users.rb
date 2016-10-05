class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bank, :string
    add_column :users, :acc_no, :string
    add_column :users, :acc_name, :string
  end
end
