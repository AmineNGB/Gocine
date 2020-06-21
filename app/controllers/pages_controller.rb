class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @favorites = []
    current_user.films.each do |fav|
      @favorites << fav.id
    end
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
