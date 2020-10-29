class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :civility, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :text
    add_column :users, :phone_number, :string
    add_column :users, :zip_code, :integer
    add_column :users, :city, :string
  end
end
