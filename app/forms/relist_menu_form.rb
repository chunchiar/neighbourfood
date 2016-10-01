class RelistMenuForm
  include ActiveModel::Model

  attr_accessor :id, :description, :expire, :collect, :pax_total, :name, :image1, :location, :price, :has_pork, :has_beef

  def initialize(product)
    @id = product.id
    @description = product.description
    @pax_total = product.pax_total
    @name = product.name
    @image1 = product.image1
    @location = product.location
    @price = product.price
    @has_pork = product.has_pork
    @has_beef = product.has_beef
    @expire = nil
    @collect = nil
  end
end
