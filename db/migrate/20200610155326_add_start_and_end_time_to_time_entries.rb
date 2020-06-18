class AddStartAndEndTimeToTimeEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :time_entries, :start_time, :timestamp, null: false
    add_column :time_entries, :end_time, :timestamp, null: false

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE time_entries ADD CONSTRAINT start_end_chk CHECK (start_time < end_time);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE time_entries DROP CONSTRAINT start_end_chk;
        SQL
      end
    end
  end
end
