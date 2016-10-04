class OrdersController < ApplicationController

  def create
    @order = current_user.orders.build(order_params);

    if @order.save
      # flash.now[:success] = "You've created a new post."
      redirect_to order_path(@order)
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to menu_path(@order.product_id)
    end

  end

  def show
    @order = Order.find_by(id: params[:id])
    @product = Product.friendly.find(@order.product_id)

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

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :phone, :email, :address)
  end

end
