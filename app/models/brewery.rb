class Brewery < ActiveRecord::Base
  include RatingAverage

	has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  #validates :year, numericality: { greater_than_or_equal_to: 1042, less_than_or_equal_to: 2014, only_integer: true}
  validates :year, numericality: { greater_than_or_equal_to: 1042, only_integer: true}
  validates :name, presence: true
  validate :year_Now
  
  def year_Now
    if :year < Date.today.year
      errors.add(:year, "Present year missing")
    end
  end

  def print_report
    #puts name
    #puts "establish at year #{year}"
    #puts "number of beers #{beers.count}"    
    #puts "number of ratings #{ratings.count}"
    puts self.name
    puts "establish at year #{self.year}"
    puts "number of beers #{self.beers.count}"    
    puts "number of ratings #{self.ratings.count}"
  end

  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end  

end
