class FavoritesController < ApplicationController
  before_action :set_film, only: [:show, :destroy]

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create!(user_id: current_user.id, film_id: params[:film_id])

    redirect_to favorites_path
  end

  def destroy
  end

  def show
  end

  private

  def favorites_params
    params.require(:favorite).permit(:user_id, :film_id)
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
