class User < ApplicationRecord
  has_many :idm, dependent: :destroy
  belongs_to :role
end
