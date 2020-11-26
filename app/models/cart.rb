class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def total
    cart_items = self.cart_items
    total = 0
    cart_items.each do |t|
      total += t.item.price
    end
    return total
  end

end
