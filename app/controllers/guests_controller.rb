class GuestsController < ApplicationController

  def decline
    guest.status = "rejected"
  end

  def confirm
    guest.status = "confirmed"
  end
end
