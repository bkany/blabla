class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :welcome_send

  has_many :orders
  has_one  :cart

  has_one_attached :avatar

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { in: 2..36 }

  def welcome_send
    puts "method ici"
    puts "method ici"
    puts "method ici"
    UserMailer.welcome_email(self).deliver_now
    puts "method ici"
    puts "method ici"
    puts "method ici"
  end

end
