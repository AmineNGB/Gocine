class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @films = Film.all
  end

  def schedule
  end

  def invitation
  end

  def final
     @event = Event.first

  end
end
