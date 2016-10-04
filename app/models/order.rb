class Order < ApplicationRecord

  validates :phone, presence: true
  validates :email, presence: true
  validates :quantity, presence: true

  # has_one :product
  belongs_to :product

end
