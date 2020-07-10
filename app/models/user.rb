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

  def fullname
    "#{prenom} #{nom}"
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
