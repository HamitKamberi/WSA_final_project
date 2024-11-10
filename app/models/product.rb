class Product < ApplicationRecord
#   belongs_to :category
#   belongs_to :brand
#   belongs_to :size
#   belongs_to :color
#   belongs_to :gender
  has_one :discount
end