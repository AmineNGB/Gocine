class Cinema < ApplicationRecord
  has_many :seances
  has_many :films, -> { distinct }, through: :seances
  validates :name, presence: true
  validates :ville, presence: true
  validates :allocine_id, presence: true, uniqueness: true

  def create_movies
    AllocineMoviesService.new(allocine_id, id).call
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_ville,
    against: [ :name, :ville ],
    using: {
      tsearch: { prefix: true }
    }

end
