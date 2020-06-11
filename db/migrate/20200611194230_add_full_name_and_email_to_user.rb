class AddFullNameAndEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string, null: false
    add_column :users, :email, :string, null: false
    add_column :users, :password, :string, null: false
    add_column :users, :password_confirmation, :string
  end
end
