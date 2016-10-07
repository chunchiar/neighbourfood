class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?

  def store_current_location
    store_location_for(:user, request.url)
  end

  def runmap
    if params[:search].present?
      #@chefs = User.chef.near(params[:search])
      coordinates = Geocoder.coordinates(params[:search])
      if coordinates.length > 0
        @chefs = User.chef.near(coordinates)
        @mapCenter = {
          "latitude" => coordinates[0],
          "longitude" => coordinates[1]
        }
      end
    else
      @chefs = User.chef
    end

    @hash = Gmaps4rails.build_markers(@chefs) do |chef, marker|

      liveproduct = false
      chef.products.each do |product|
        if chef.products.first.expire > DateTime.now
          liveproduct = true
        end
      end

      if liveproduct
        marker.lat chef.latitude
        marker.lng chef.longitude
        marker.infowindow render_to_string(partial: "/locations/infowindow", :locals => {:chef => chef})
        #"user.image.url(:thumb)",
        marker.picture({
          "url" => "#{chef.profile_image.mapthumb}",
          "width" => 32,
          "height" => 32,
          })
      end


    end

  end

  private
  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end

  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end

end
