class Order < ApplicationRecord

  validates :phone, presence: true
  validates :email, presence: true
  validates :quantity, presence: true

  # has_one :product
  belongs_to :product
  belongs_to :user

  enum order_status: [:pending, :processed, :completed]

end
