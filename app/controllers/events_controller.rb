class EventsController < ApplicationController
  def index
    @events = Event.all
    # @friend_requests = current_user.requested_friends
  end

  def show
    @event = Event.find(params[:id])
    # @friend_requests = current_user.requested_friends
  end

  def new
    # @friend_requests = current_user.requested_friends
    if current_user.favorites.count < 3
      flash[:alert] = "Vous devez avoir au moins 3 films dans votre liste"
      redirect_to favorites_path
    end
    @event = Event.new
  end

  def create
    # @friend_requests = current_user.requested_friends
    @friends = current_user.friends
    @event = Event.new(event_params)

    @event.save

    if @event.save
      @event.guests.create!(user_id: current_user.id, status: "confirmed")
      url = answer_url(@event.id)
      @guests = @event.guests.reverse.drop(1).reverse
      @guests.each do |guest|
        UserMailer.with(event: @event, url: url, guest: guest).ask_for_event.deliver_later
      end
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
  end

  def result
    # @friend_requests = current_user.requested_friends
    @event = Event.find(params[:id])
    seance = MovieMatcher.new(@event).find_best_seance
    if seance == 0
      redirect_to no_film_path
      return nil
    end
    @event.seance = seance
    @event.save!
    @seance = Seance.find(@event.seance_id)
    participants = @event.participants
    participants.each do |guest|
      UserMailer.with(guest: guest, event: @event).final.deliver_later
    end
    redirect_to final_path
  end

  def answer
    # @friend_requests = current_user.requested_friends
    @event = Event.find(params[:id])
    # url = answer_url
    # UserMailer.ask_for_event(@event, url).deliver
  end

  def final
    # @friend_requests = current_user.requested_friends
    @event = Event.find(params[:id])
    # guest = @event.guests.find_by(user: current_user)
    # guest.confirmed!
  end

  private

  def event_params
    params.require(:event).permit(:schedule, :endschedule, :users, :cinema_id, :date, user_ids: [])
  end
end
