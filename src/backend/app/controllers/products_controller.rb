class ProductsController < ApplicationController
  def index
    products = Product.active_all
    render json: ActiveModel::Serializer::CollectionSerializer.new(
        products,
        each_serializer: ProductSerializer
    ).to_json
  end
end
