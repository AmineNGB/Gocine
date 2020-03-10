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
      # MovieMatcher.new(@event).find_best_seance
    else
      render new
    end

    redirect_to event_path(@event)
  end

  def destroy
  end

  def result
    MovieMatcher.new(@event).find_best_seance
  end

  def answer
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:schedule, :users, :cinema_id, :date, user_ids: [])
  end
end
