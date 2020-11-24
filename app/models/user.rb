class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many   :orders
  has_one    :cart

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { in: 2..36 }
end
