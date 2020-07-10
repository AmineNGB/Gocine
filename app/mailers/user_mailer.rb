class UserMailer < ApplicationMailer
    default from: 'gocineclub@gmail.com'
 
  def ask_for_event(event, url)
    @guests_all = event.guests
    @url = url
    @favorites = favorites_url
    @guests = @guests_all.reverse.drop(1).reverse
    @guests.each do |guest|
        @guest = guest
        @event = event
        @creator = event.guests.last.user.fullname
        mail(to: guest.user.email, subject: 'Veux-tu participer à la sortie Cinéma ?')
    end
  end
end
