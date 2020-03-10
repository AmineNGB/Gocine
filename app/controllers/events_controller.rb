class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
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

    redirect_to root_path
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:schedule, :users, :cinema_id, :date, user_ids: [])
  end
end
