class AddNotNullConstraintToAllTables < ActiveRecord::Migration
  def change
    change_column :contacts, :name, :string, :null => false
    change_column :contacts, :email, :string, :null => false
    change_column :contacts, :user_id, :integer, :null => false
    change_column :favorites, :user_id, :integer, :null => false
    change_column :favorites, :contact_id, :integer, :null => false
    change_column :users, :name, :string, :null => false
    change_column :users, :email, :string, :null => false
    change_column :users, :password, :string, :null => false
  end
end
