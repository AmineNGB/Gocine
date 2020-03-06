class Api::FavoritesController < ApplicationController

  def sort
    params["_json"].each_with_index do |favorite_id, index|
    # params => { favorites: [2, 3, 12] }
      Favorite.where(id: favorite_id.to_i).update_all(position: index + 1 )
    end
  end
end
