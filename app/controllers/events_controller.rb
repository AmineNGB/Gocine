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
      UserMailer.ask_for_event(@event, url).deliver
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
    @event.seance = seance
    @event.save!
    @seance = Seance.find(@event.seance_id)
    UserMailer.final(@event).deliver
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
    params.require(:event).permit(:schedule, :users, :cinema_id, :date, user_ids: [])
  end
end
