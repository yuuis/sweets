class Purchase < ApplicationRecord
  has_many :purchased_product, dependent: :destroy
end
