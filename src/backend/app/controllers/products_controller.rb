class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    products = Product.active_all
    render json: ActiveModel::Serializer::CollectionSerializer.new(
        products,
        each_serializer: ProductSerializer
    ).to_json
  end

  def show
    product = Product.find(params[:id])
    render json: product, status: :ok
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
