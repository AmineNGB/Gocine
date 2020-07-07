class GuestsController < ApplicationController
  def decline
    @event = Event.find(params[:id])
    guest = @event.guests.find_by(user: current_user)
    if guest.user == current_user
      guest.rejected!
    end
    redirect_to root_path
  end

  def confirm
    @event = Event.find(params[:id])
    guest = @event.guests.find_by(user: current_user)
    if guest.user == current_user
      guest.confirmed!
    end
    redirect_to answer_path
  end
end
