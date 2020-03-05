class AddPositionToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :position, :integer
  end
end
