class UpdateUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name, :string
    rename_column :users, :email, :username
  end
end
