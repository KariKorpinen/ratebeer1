require 'spec_helper'
  #
  def create_beer_with_rating(score,user)
    beer = FactoryGirl.create(:beer)
    FactoryGirl.create(:rating, score:score, beer:beer, user:user)
    beer
  end

  def create_beers_with_ratings(*scores,user)
    scores.each do |score|
      create_beer_with_rating(score,user)
    end
  end


describe User do
  it "username too short" do
    user = User.create username:"Pe", password:"Secret1", password_confirmation:"Secret1"    
    # tai expect(user.username).to eq("Pekka")
    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "password contains only characters" do
    #user = User.new username:"Pekka"
    user = User.create username:"Pekka", password:"Secret", password_confirmation:"Secret"
    #user.username.should == "Pekka"
    # tai expect(user.username).to eq("Pekka")
  
    #tai expect(user).to be_valid
    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "has the username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
    # tai expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user.valid?).to be(false)
    
    # tai expect(user).not_to be_valid

    #expect(user.username).to be("Pekka") - ei mene läpi "to be" ja boolean arvot testeissä
    expect(User.count).to eq(0)
  end
  describe "with a proper password" do
   # let(:user){ User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1" }
  let(:user){ FactoryGirl.create(:user) }
    it "is saved" do
      #user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"
      expect(user).to be_valid
      #expect(user.valid?).to be(true)
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      #user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"
      #rating = Rating.new score:10
      #rating2 = Rating.new score:20
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)
       
      #user.ratings << rating
      #user.ratings << rating2

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end
  end
  
  describe "favorite beer" do
    let(:user){FactoryGirl.create(:user) }    
 
    it "has method for determining one" do
    #it "has method for determining the favorite_beer" do
      #user = FactoryGirl.create(:user)
      user.should respond_to :favorite_beer 
    end

    it "without ratings does not have one" do
    #it "without ratings does not have a favorite beer" do
      #user = FactoryGirl.create(:user)
      expect(user.favorite_beer).to eq(nil)    
    end

    it "is the only rated if only one rating" do
      #beer = FactoryGirl.create(:beer)
      #rating = FactoryGirl.create(:rating, beer:beer, user:user)
      beer = create_beer_with_rating(10, user)  
    
      expect(user.favorite_beer).to eq(beer)    
    end
    
    it "is the one with highest rating if several rated" do
      #allaolevat kommentoidut tehty ilman apumetodia
      #beer1 = FactoryGirl.create(:beer)
      #beer2 = FactoryGirl.create(:beer)
      #beer3 = FactoryGirl.create(:beer)
      #rating1 = FactoryGirl.create(:rating, beer:beer1, user:user)
      #rating2 = FactoryGirl.create(:rating, score:25, beer:beer2, user:user)
      #rating3 = FactoryGirl.create(:rating, score:9, beer:beer3, user:user)
      #create_beer_with_rating(10, user)
      #best = create_beer_with_rating(25, user)
      #create_beer_with_rating(7, user)

      create_beers_with_ratings(10, 20, 15, 7, 9, user)
      best = create_beer_with_rating(25, user)

      #expect(user.favorite_beer).to eq(beer2) 
      expect(user.favorite_beer).to eq(best)    
    end
  
  end

  describe "the application" do
    it "does something with two users" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, username:"Arto")
      end
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
