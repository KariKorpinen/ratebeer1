require 'spec_helper'

describe Beer do
  it "valid beer" do
    beer = Beer.create name:"Olut", style:"vaalea"    
    # tai expect(user.username).to eq("Pekka")
    expect(beer.valid?).to be(true)
    #tapaus,että count on jätetty testistä ja tallennus on tapahtunu aikaisemmin
    expect(Beer.count).to eq(2)
    #pending "add some examples to (or delete) #{__FILE__}"
  end 
  it "beer dont have name" do
    beer = Beer.create name:"", style:"vaalea"    
    # tai expect(user.username).to eq("Pekka")
    expect(beer.valid?).to be(false)
    #tapaus,että count on jätetty testistä ja tallennus on tapahtunu aikaisemmin
    expect(Beer.count).to eq(1)
    #pending "add some examples to (or delete) #{__FILE__}"
  end 
  it "beer dont have style" do
    beer = Beer.new name:"OlutA"  

    style2 = Beer.new style:
    beer.style = style2  
    # tai expect(user.username).to eq("Pekka")
    #expect(beer.valid?).to be(false)
    #expect(beer.valid?).to be(false)
    #expect(beer.valid?).to be(false)
    expect(beer.style.nil?).to be(true)
    #validates :name, presence: true
    #tapaus,että count on jätetty testistä ja tallennus on tapahtunu aikaisemmin
    expect(Beer.count).to eq(1)
    #pending "add some examples to (or delete) #{__FILE__}"
  end
  describe "when one beer exists" do
    let(:beer){FactoryGirl.create(:beer)}
    
    it "is valid" do
      expect(beer).to be_valid
    end

    it "has the default style" do
      expect(beer.style).to eq("Lager")
    end
  end
 
end
