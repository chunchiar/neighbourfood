class LocationsController < ApplicationController

  def index
    if params[:search].present?
      #@chefs = User.cooks.near(params[:search])
      coordinates = Geocoder.coordinates(params[:search])
      if coordinates.length > 0
        @chefs = User.cooks.near(coordinates)
        @mapCenter = {
          "latitude" => coordinates[0],
          "longitude" => coordinates[1]
        }
      end
    else
      @chefs = User.cooks
    end

    @hash = Gmaps4rails.build_markers(@chefs) do |chef, marker|
      marker.lat chef.latitude
      marker.lng chef.longitude
      marker.infowindow render_to_string(partial: "/locations/infowindow", :locals => {:chefs => chef})
      #"user.image.url(:thumb)",
      marker.picture({
        "url" => "http://i1174.photobucket.com/albums/r618/mashstore/spoon_marker%201_zpspa5ktwyl.png",
        "width" => 32,
        "height" => 32})
    end
  end

end
