class Purchase < ApplicationRecord
  has_many :purchased_product, dependent: :destroy
  enum status: { waiting: 0, success: 1, failed: 2}
end
