class UserMailer < ApplicationMailer
  default from: "gocineclub@gmail.com"

  def ask_for_event
    @event = params[:event]
    @url = params[:url]
    @guests_all = @event.guests
    @favorites = favorites_url
    @creator = @event.guests.last.user.to_s
    # @guests = @guests_all.reverse.drop(1).reverse
    # @guests.each do |guest|
    @guest = params[:guest]
    mail(to: @guest.user.email, subject: "Veux-tu participer à la sortie Cinéma ?")
    # end
  end

  def final
    @event = params[:event]
    @guest = params[:guest]
    @participants = @event.participants
    @seance = @event.seance
    @cinema = @event.cinema
    @film = @seance.film
    @date = l @seance.horaire, format: :long2
    @url = @seance.link
    mail(to: @guest.user.email, subject: "Voici votre séance !")
  end
end
