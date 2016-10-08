class LandingController < ApplicationController

  def index

    # @latest = Product.order(created_at: :desc)
    @latest = Product.where("expire > ?", DateTime.now).order(created_at: :desc).first(9)
    @just_sold = Order.order(created_at: :desc).first(9)
    @expiring = Product.where("expire > ?", DateTime.now).order(expire: :asc).first(9)
    # map function

    runmap
  end

end
