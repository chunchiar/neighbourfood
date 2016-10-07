class LandingController < ApplicationController

  def index

    # @latest = Product.order(created_at: :desc)
    @latest = Product.where("expire > ?", DateTime.now).order(created_at: :desc).first(3)
    @just_sold = Order.order(created_at: :desc).first(3)
    @expiring = Product.where("expire > ?", DateTime.now).order(expire: :asc).first(3)
    # map function

    runmap
  end

end
