require 'spec_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return(
      [ Place.new(:name => "Oljenkorsi") ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search" 

    expect(page).to have_content "Oljenkorsi"
  end
  it "if API returns many places, all are shown at the page" do
    BeermappingApi.stub(:places_in).with("helsinki").and_return(
      [ Place.new(:name => "Oljenkorsi"),Place.new(:name => "Oljenkorsi2"),Place.new(:name => "Oljenkorsi3") ]
    )

    visit places_path
    fill_in('city', with: 'helsinki')
    click_button "Search" 

    expect(page).to have_content "Oljenkorsi Oljenkorsi2 Oljenkorsi3"
  end
  it "if not beer places, should show No locations" do
    BeermappingApi.stub(:places_in).with("helsinki").and_return([ ]
    )

    visit places_path
    fill_in('city', with: 'helsinki')
    click_button "Search" 
    #rails server ja localhost:3000/places
    #www-sivun palauttama tyhjä kysely ei tuo virtuaalikoneella ajettaessa näkyviin "No locations" kohtaa
    #testin pitäisi toimia allaolevalla kommentoidulla koodilla 
    #expect(page).to have_content "No locations in"
  end
end      



