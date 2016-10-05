class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @current_menus = @user.products.where("expire > ?", DateTime.now).order(created_at: :desc)
    @past_menus = @user.products.where("expire < ?", DateTime.now).order(created_at: :desc)
    @orders = @user.orders;

    @favs = @user.given_fav;
    
    if current_user
      @fav = Favourite.find_by(keeper_id: current_user.id, fav_id: @user.id)
      if @fav
        @class = "btn-danger"
        @text = "Unfollow Chef"
      else
        @class = "btn-success"
        @text = "Follow Chef"
      end
    end

  end

end
