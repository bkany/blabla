class User < ApplicationRecord
  has_many   :orders
  belongs_to :cart
end
