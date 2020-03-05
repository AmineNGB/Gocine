class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :destroy]
  def index
  end

  def create
    @favorite = Favorite.new(favorites_params)
    @user = current_user
    @favorite.save!
  end

  def destroy
  end

  def show
  end

  private

  def favorites_params
    params.require(:favorite).permit(:user_id, :film_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
