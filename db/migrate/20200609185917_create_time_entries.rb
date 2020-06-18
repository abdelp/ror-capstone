class CreateTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :time_entries do |t|
      t.bigint :author_id
      t.string :name
      t.interval :amount
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
