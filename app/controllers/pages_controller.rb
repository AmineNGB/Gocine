class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @favorites = []
    if current_user
      current_user.films.each do |fav|
        @favorites << fav.id
      end
    end
    @films = Film.all
  end

  def schedule
  end

  def invitation
  end

  def friends
    @friends = current_user.friends
    @friend_requests = current_user.requested_friends
    @friend_request = FriendRequest.new
  end

  def final
    @event = Event.first
    @date = Seance.find(Event.last.cinema_id).horaire.time
  end
end
