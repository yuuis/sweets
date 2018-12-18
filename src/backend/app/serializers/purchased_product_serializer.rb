class PurchasedProductSerializer < ActiveModel::Serializer
  attributes :id, :purchase_id, :quantity, :product_id
end
