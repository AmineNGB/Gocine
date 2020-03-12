class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @friends = current_user.friends
    @event = Event.new(event_params)

    if @event.save!
      @event.guests.create!(user_id: current_user.id, status: 'confirmed')
      puts "c'est cool"
    else
      render new
    end

    redirect_to event_path(@event)
  end

  def destroy
  end

  def result
    @event = Event.find(params[:id])
    # ap "event"
    # ap @event
    seance = MovieMatcher.new(@event).find_best_seance
    # ap seance
    @event.seance = seance
    @event.save!
    # ap @event
    redirect_to final_path
  end

  def answer
    @event = Event.find(params[:id])
  end

  def final
    @event = Event.find(params[:id])
    guest = @event.guests.find_by(user: current_user)
    # guest.confirmed!
  end

  private

  def event_params
    params.require(:event).permit(:schedule, :users, :cinema_id, :date, user_ids: [])
  end
end
