class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @favorites = Favorite.all
    @films = Film.all
  end

  def schedule
  end

  def invitation
  end

  def final
     @event = Event.first
     @date = Seance.find(Event.last.cinema_id).horaire.time

  end
end
