class Order < ApplicationRecord
  belongs_to :client
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
  has_many :products, through: :order_items
end