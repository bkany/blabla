class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :total_price, :status, presence: true
  validates :total_price, numericality: true
  
  after_create :confirmation_order

  def confirmation_order
    puts "method ici"
    puts "method ici"
    puts "method ici"
    UserMailer.confirmation_order_user_email(self).deliver_now
    puts "method ici"
    puts "method ici"
    puts "method ici"
  end
end
