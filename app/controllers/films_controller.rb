class FilmsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_film, only: [:show]

  def index
    @films = Film.all
  end

  def create
    @film = Film.new(film_params)
    @film.save!
    redirect_to films_path
  end

  def show
  end

  private

  def film_params
    params.require(:film).permit(:name, :description, :price, :photo)
  end

  def set_film
    @film = Film.find(params[:id])
  end

end
