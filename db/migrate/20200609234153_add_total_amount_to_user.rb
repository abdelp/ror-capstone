class AddTotalAmountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_amount, :interval, default: "00:00:00"
  end
end
