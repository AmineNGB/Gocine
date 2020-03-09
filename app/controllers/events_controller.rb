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
    @event = Event.new(event_params)

    if @event.save
      puts "c'est cool"
    else
      render new
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:schedule, :guest, :cinema_id, :date)
  end

end
