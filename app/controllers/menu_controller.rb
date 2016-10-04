class MenuController < ApplicationController
  respond_to :js
  before_action :authenticate_user!, except: [:show]
  before_action :checkifchef, except: [:show]
  before_action :checkifchefownpost, only: [:edit, :relist]

  def show
    # @product = Product.find_by(id: params[:id])
    @product = Product.friendly.find(params[:id])
    @order = Order.new
    @orders = @product.orders
    @total_left = @product.pax_total - @orders.sum(:quantity)

    if current_user
      @fav = Favourite.find_by(keeper_id: current_user.id, fav_id: @product.user.id)
      if @fav
        @class = "btn-danger"
        @text = "Unfollow Chef"
      else
        @class = "btn-success"
        @text = "Follow Chef"
      end
    end

  end

  def new
    @product = Product.new
  end

  def relist
    @product = Product.new
    # @product_old = Product.find_by(id: params[:menu_id])
    @product_old = Product.friendly.find(params[:menu_id])
    # @product = RelistMenuForm.new(menu)
  end

  def create
    @product = current_user.products.build(menu_params)

      if @product.save
        # flash[:success] = "You've created a new menu."
        # in future redirects to the product page
        redirect_to users_chef_path
      else
        # flash[:danger] = @product.errors.full_messages
        render new_menu_path
      end

  end

  def edit
    @product = Product.friendly.find(params[:id])
  end

  def update
    @product = Product.friendly.find(params[:id])

    if @product.update(menu_params)
      redirect_to users_chef_path
    else
      flash.now[:danger] = @product.errors.full_messages
      # redirect_to edit_menu_path(@product)
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id])
    if @product.destroy
      flash.now[:success] = "#{@product.name} was deleted."
    end
  end

  private

  def checkifchef
    unless current_user&.chef?
      redirect_to root_path
    end
  end

  def checkifchefownpost
    if params[:id]
      @product = Product.friendly.find(params[:id])
    elsif params[:menu_id]
      @product = Product.friendly.find(params[:menu_id])
    end

    unless @product.user == current_user
      redirect_to users_chef_path
    end
  end

  def menu_params
    params.require(:product).permit(:name, :description, :location, :expire, :collect, :pax_total, :price, :has_pork, :has_beef, :image1)
  end

end
