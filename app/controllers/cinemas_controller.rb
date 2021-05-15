class CinemasController < ApplicationController
  def names
    cinemas = Cinema.all
    cinemas.each do |cine|
      cine.name
    end
  end
end
