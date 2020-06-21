class RemoveFullNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :full_name
  end
end
