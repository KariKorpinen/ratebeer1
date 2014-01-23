class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
  	#beer=beer.count
  	#sum = 0
  	#maara=0
    ratings.average('score')
    
  	#beer.ratings.each do |c|
    #  sum += c.score

    #  link_to brewery.name,brewery
      
              
    #beer.name + " " + score.to_s 
  end
  def to_s
    name + " " + brewery.name 
  end
end
