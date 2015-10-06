class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :shop_name, :string
    add_column :users, :avatar, :string
    add_column :users, :passport, :string
    add_column :users, :birthday, :date

    add_index :users, :role
  end
end
