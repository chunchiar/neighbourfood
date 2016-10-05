class ListController < ApplicationController
  respond_to :js

  def index
    @product = Product.friendly.find(params[:order_id])
    @orders = @product.orders;
  end

end
