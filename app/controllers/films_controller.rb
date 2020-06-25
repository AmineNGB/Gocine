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
    @favorites = []
    if current_user
      current_user.films.each do |fav|
        @favorites << fav.id
      end
    end
  end

  private

  def film_params
    params.require(:film).permit(:title, :photo_url, :synopsis, :duration, :date_release, :genre, :rate_press, :rate_viewer, :allocine_id)
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
