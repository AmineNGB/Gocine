class GuestsController < ApplicationController

  def decline
    current_user.status = "rejected"
  end

  def confirm
    guest = Guest.find(params[:id])
    if guest.user == current_user
      guest.confirmed!
    end
  end
end
