class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, -> { order(position: :asc) }, dependent: :destroy
  has_many :films, through: :favorites
  has_friendship
  has_many :guests
  has_many :events, through: :guests
  has_many :friended_users, foreign_key: :friended_id, class_name: "Friendship"
  has_many :frienders, through: :friended_users
  has_many :friender_users, foreign_key: :friender_id, class_name: "Friendship"
  has_many :friendeds, through: :friender_users
  has_many :requested_users, foreign_key: :requested_id, class_name: "FriendRequest"
  has_many :requesters, through: :requested_users
  has_many :requester_users, foreign_key: :requester_id, class_name: "FriendRequest"
  has_many :requesteds, through: :requester_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def to_s
    if self.prenom && self.nom
      "#{prenom} #{nom}"
    else
      "#{email}"
    end
  end

  def self.from_omniauth_fb(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # ap auth.info
      user.prenom = auth.info.name.split(" ")[0]   # assuming the user model has a name
      user.nom = auth.info.name.split(" ")[1]
      # user.image = auth.info.image # assuming the user model has an image
      user.skip_confirmation!
    end
  end

  def self.from_omniauth_google(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(prenom: data["first_name"],
                         nom: data["last_name"],
                         email: data["email"],
                         password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
    end
    user
  end

  def pending_events
    pending_events = []
    self.events.each do |event|
      event.guests.each do |guest|
        if guest.user == self && guest.status == "pending" && !event.seance
          pending_events << event
        end
      end
    end
    pending_events
  end

  def coming_events
    coming_events = []
    self.events.each do |event|
      event.guests.each do |guest|
        if guest.user == self && guest.status == "confirmed" && event.seance && event.seance.horaire > DateTime.now
          coming_events << event
        end
      end
    end
    coming_events
  end

  def old_events
    old_events = []
    self.events.each do |event|
      old_events << event if event.seance && event.seance.horaire < DateTime.now
    end

    old_events
  end

  def strangers
    users = []
    User.all.each do |user|
      if (self.friends_with?(user) != true && self != user && self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
        users << user
      end
    end
    users
  end

  # def friend_request(user)
  #   FriendRequest.create(requester: self, requested: user)
  # end

  # def accept_request(user)
  #   ap FriendRequest.find_by(requester: self)
  #   FriendRequest.find_by(requester: self, requested: user).destroy
  #   Friendship.create(friender: self, friended: user)
  # end
end
