class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def reserve
    purchase = Purchase.new(status: :waiting)
    purchase.save
    purchased_product = params["_json"].map do |param|
      PurchasedProduct.new(product_id: param[:product_id], quantity: param[:quantity], purchase_id: purchase.id)
    end

    if (PurchasedProduct.import purchased_product).failed_instances.empty?
      render json: purchased_product, status: :created
      # felica readerをactiveにする処理
      # purchase_idも一緒に送る
    else
      render json: { errors: purchase.errors }, status: :unprocessable_entity
    end
  end

  def create
    purchase = Purchase.find(params[:purchase_id])
    user = User.find(Idm.find_by(value: params[:idm]).user_id)
    if purchase && user
      purchase.user_id = user.id
      if purchase.save
        render json: purchase, status: :created
      else
        render json: {errors: purchase.errors}, status: :unprocessable_entity
      end
    end
  end

end
