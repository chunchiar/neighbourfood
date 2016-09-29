class MenuController < ApplicationController

  before_action :authenticate_user!
  before_action :checkifchef

  def index

  end

  def new
    @menu = Product.new
  end

  def create
    @menu = current_user.products.build(menu_params)

      if @menu.save
        # flash[:success] = "You've created a new topic."
        redirect_to users_chef_path
      else
        # flash[:danger] = @topic.errors.full_messages
        render new_menu_path
      end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def checkifchef
    unless current_user&.chef?
      redirect_to root_path
    end
  end

  private

  def menu_params
    params.require(:product).permit(:name, :description, :location, :end, :collect, :pax_total, :price, :has_pork, :has_beef, :image1)
  end

end
