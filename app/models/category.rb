class Category < ApplicationRecord
  has_many :items

  validates :name,
            uniqueness: true,
            presence: true,
            length: { in: 3..30 }
end
