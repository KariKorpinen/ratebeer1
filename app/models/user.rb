class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true, length: { minimun: 3, maximum: 15}
  validates :password, length: { minimun: 4}, format: { in: [a-zA-Z0-9]}
  has_many :ratings #käyttäjällä on monta ratingia.
  has_many :beers, through: :ratings

  has_secure_password
end
