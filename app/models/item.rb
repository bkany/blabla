class Item < ApplicationRecord
  belongs_to :category
  has_many   :order_item
  has_many   :order, through: :order_item
  has_many   :cart_item
  has_many   :cart, through: :cart_item
end