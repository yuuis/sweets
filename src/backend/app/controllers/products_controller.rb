class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: ActiveModel::ArraySerializer.new(
        products,
        each_serializer: ProductSerializer
    ).to_json
  end
end
