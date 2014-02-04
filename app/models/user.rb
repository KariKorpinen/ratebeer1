class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
                       length: { in: 3..15 }

  validates :password, length: { minimum: 3 },
                       format: { with: /.*(\d.*[A-Z]|[A-Z].*\d).*/,
                                 message: "should contain a uppercase letter and a number" }


  has_secure_password

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  def favorite_beer
    return nil if ratings.empty? #palautetaan nil,jos reittauksia ei ole
    #ratings.first.beer #palautetaan ensimmäiseen reittaukseen liityvä olut
    # eka versio - ratings.sort_by{ |r| r.score }.last.beer #palautetaan ensimmäiseen reittaukseen liityvä olut
    # tai voi kirjoittaa suoraan ratings.sort_by{&:score }.last.beer
    ratings.order(score: :desc).limit(1).first.beer
  end
end
