class UserMailer < ApplicationMailer
  default from: "gocineclub@gmail.com"

  def ask_for_event(event, url)
    @event = event
    @guests_all = @event.guests
    @url = url
    @favorites = favorites_url
    @creator = @event.guests.last.user.to_s
    @guests = @guests_all.reverse.drop(1).reverse
    @guests.each do |guest|
      @guest = guest
      mail(to: guest.user.email, subject: "Veux-tu participer à la sortie Cinéma ?")
    end
  end

  def final(event)
    @event = event
    @guests = @event.guests
    @seance = @event.seance
    @cinema = @event.cinema
    @film = @seance.film
    @date = l @seance.horaire, format: :long2
    # @creator = event.guests.last.user.to_s
    @url = @seance.link
    @guests.each do |guest|
      @guest = guest
      mail(to: guest.user.email, subject: "Voici votre séance !")
    end
  end
end
