class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
    @hash = Gmaps4rails.build_markers(@chefs) do |chef, marker|
      marker.lat chef.latitude
      marker.lng chef.longitude
      marker.infowindow "#{chef.email}"
    end
  end

end
