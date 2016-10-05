class LandingController < ApplicationController

  def index

    # @latest = Product.order(created_at: :desc)
    @latest = Product.where("expire > ?", DateTime.now).order(created_at: :desc)
    @just_sold = Order.order(created_at: :desc)
    @expiring = Product.where("expire > ?", DateTime.now).order(expire: :asc)

  end

end
