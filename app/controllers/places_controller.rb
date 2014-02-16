class PlacesController < ApplicationController
  def index
  end

  def show
    #@rating = Rating.new
    #@rating.beer = @beer
    @place = Place.new
    #@place = place
    #@place.street = place.to_s
  end

  def search#fetch_places_in(
    #@places = BeermappingApi.places_in(params[:city])
    @places = BeermappingApi.fetch_places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end
end
