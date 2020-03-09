class RemoveUseridFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :user
  end
end
