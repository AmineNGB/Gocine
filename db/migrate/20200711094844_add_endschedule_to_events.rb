class AddEndscheduleToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :endschedule, :integer
  end
end
