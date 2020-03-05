class AddPositionToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :position, :integer
    Favorite.order(:updated_at).each.with_index(1) do |favorite, index|
      favorite.update_column :position, index
  end
end
end
