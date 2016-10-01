class User < ApplicationRecord
  #  has_many :can_name_anything, class_name: "Favourite", foreign_key: "keeper_id", source :favourite
  has_many :given_fav, class_name: "Favourite", foreign_key: "keeper_id", source: :favourite
  has_many :received_fav, class_name: "Favourite", foreign_key: "fav_id", source: :favourite

  has_many :given_rating, class_name: "Rating", foreign_key: "giver_id", source: :rating
  has_many :received_rating, class_name: "Rating", foreign_key: "receiver_id", source: :rating

  has_many :given_review, class_name: "Review", foreign_key: "giver_id", source: :review
  has_many :received_review, class_name: "Review", foreign_key: "receiver_id", source: :review

  has_many :comments
  has_many :products
  belongs_to :country

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:customer, :chef, :admin]

  scope :cooks, -> { where(role: 1) }
  #field :coordinates, :type => Array
  #attr_accessible :address, :latitude, :longitude
  geocoded_by :address   # can also be an IP address
  after_validation :geocode, :if => :address_changed?          # auto-fetch coordinates

  #def address
    #[address, state, country].compact.join(', ')
  #end

  validates :name, presence: true
  validates :email, presence: true

  mount_uploader :profile_image, ImageUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # 
      # user.address = "This is required"
      # user.phone = "This is required"
    end
  end
end
