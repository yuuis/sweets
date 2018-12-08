class Product < ApplicationRecord
  has_many :purchased_product, dependent: :restrict_with_error
end
