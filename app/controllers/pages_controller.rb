class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @favorites = []
    if current_user
      # @friend_requests = current_user.requested_friends
      current_user.films.each do |fav|
        @favorites << fav.id
      end
    end
    @films = Film.now_on_theater

    if params[:query].present? && params.dig(:query, :id).to_i != 0
      # sql_query = "name ILIKE :query OR ville ILIKE :query"
      # @cinemas = Cinema.where(sql_query, query: "%#{params[:query]}%")
      # @films = []
      # @cinemas.each do |cinema|
      #   @films << cinema.films
      # end
      # @films = @films.flatten
      @cinema = Cinema.find(params.dig(:query, :id).to_i)
      @films = @cinema.films.order("date_release DESC")
    else
      @films = Film.now_on_theater
    end
  end

  def schedule
  end

  def invitation
  end

  def my_events
    @user = current_user
    @pending_events = @user.pending_events + @user.coming_events
    @old_events = @user.old_events
  end

  def friends
    @friends = current_user.friends
    @friend_requests = current_user.requested_friends
    @friend_request = FriendRequest.new
    @pending_friends = current_user.pending_friends
    ap "pending : #{@pending_friends}"
    ap "requests : #{@friend_requests}"
  end

  def final
    # @friend_requests = current_user.requested_friends
    @event = Event.first
    @date = Seance.find(Event.last.cinema_id).horaire.time
  end
end
