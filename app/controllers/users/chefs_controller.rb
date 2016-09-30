class Users::ChefsController < ApplicationController
  before_action :authenticate_user!
  before_action :checkifchef

  def index
    @user = current_user
    # @current_menus = Product.order(created_at: :desc)
    # @current_menus = Product.where("expire > ?", DateTime.now)
    @current_menus = current_user.products.where("expire > ?", DateTime.now).order(created_at: :desc)
    # binding.pry

    # @past_menus = Product.where("expire < ?", DateTime.now)
    @past_menus = current_user.products.where("expire < ?", DateTime.now).order(created_at: :desc)
  end

  private

  def checkifchef
    unless current_user&.chef?
      redirect_to root_path
    end
  end

end
