class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :status
  has_many :purchased_product
end
