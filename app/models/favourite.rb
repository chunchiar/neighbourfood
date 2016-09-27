class Favourite < ApplicationRecord

  belongs_to :keeper, class_name: "User", foreign_key: "keeper_id"
  belongs_to :fav, class_name: "User", foreign_key: "fav_id"

end
