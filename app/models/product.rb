class Product < ApplicationRecord

  has_many :images
  has_many :comments
  belongs_to :user

  mount_uploader :image1, MenuImageUploader

end
