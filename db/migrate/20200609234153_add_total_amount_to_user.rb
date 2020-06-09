class AddTotalAmountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_amount, :integer, default: 0
  end
end
