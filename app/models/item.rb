class Item < ApplicationRecord
  belongs_to :category
  has_many   :order_items
  has_many   :orders, through: :order_items
  has_many   :cart_items
  has_many   :carts, through: :cart_items

  validates :title, :description, :price, :image_url, presence: true
  validates :title, length: { in: 3..30 }
  validates :description, length: { in: 4..10000 }
  validates :price, numericality: true
  validates :image_url, uniqueness: true

end
