class Changeeventtable < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :schedule
    add_column :events, :schedule, :integer
    add_column :events, :date, :date
  end
end
