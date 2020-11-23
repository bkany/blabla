class Item < ApplicationRecord
  belongs_to :category
  has_many   :order_item
  has_many :cart, through: :order_item
end
