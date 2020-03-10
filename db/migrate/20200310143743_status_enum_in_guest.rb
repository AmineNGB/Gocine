class StatusEnumInGuest < ActiveRecord::Migration[6.0]
  def change
    remove_column :guests, :status
    add_column :guests, :status, :integer, default: 0
  end
end
