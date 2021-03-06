class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :images
  has_many :comments
  belongs_to :user
  # belongs_to :order
  has_many :orders

  mount_uploader :image1, MenuImageUploader

  validates :collect, presence: true
  validates :expire, presence: true
  validates :collect, presence: true
  validates :pax_total, presence: true
  # validates :location, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :image1, presence: true

  # geocoded_by :location
  # after_validation :geocode, :if => :address_changed?

end
