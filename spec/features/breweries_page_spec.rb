require 'spec_helper'

describe "Breweries page" do
  it "should not have any before been created" do
    visit breweries_path
    expect(page).to have_content 'Listing breweries'
    expect(page).to have_content 'Number of breweries: 0'

    puts page.html
    save_and_open_page
  end

  it "lists the existing breweries and their total number" do
    breweries = ["Koff","Karjala","Schenkerla"]
    breweries.each do |brewery_name|
      FactoryGirl.create(:brewery, name:brewery_name)
    end
    visit breweries_path
    expect(page).to have_content "number of breweries #{breweries.count}"

    breweries.each do |brewery_name|
      expect(page).to have_content brewery_name
    end
  end
end
