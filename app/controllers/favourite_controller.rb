class FavouriteController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def follow
    @fav = Favourite.find_by(keeper_id: current_user.id, fav_id: params[:chef_id])
    if @fav
      @fav.destroy
      flash.now[:danger] = "You have unfollow this chef."
      @success = 0
    else
      @fav = Favourite.new
      @fav.keeper_id = current_user.id
      @fav.fav_id = params[:chef_id]
      @fav.save
      flash.now[:success] = "You have successfully follow this chef."
      @success = 1
    end
  end

end
