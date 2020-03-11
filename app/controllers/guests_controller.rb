class GuestsController < ApplicationController

  def decline
    guest = Guest.find(params[:id])
    if guest.user == current_user
      guest.rejected!
    end
  end

  def confirm
    guest = Guest.find(params[:id])
    if guest.user == current_user
      guest.confirmed!
    end
  end
end
