class Role < ApplicationRecord
  has_many :user, dependent: :destroy
end
