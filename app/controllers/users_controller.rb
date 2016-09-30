class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @current_menus = @user.products.where("expire > ?", DateTime.now).order(created_at: :desc)
    @past_menus = @user.products.where("expire < ?", DateTime.now).order(created_at: :desc)
  end

end
