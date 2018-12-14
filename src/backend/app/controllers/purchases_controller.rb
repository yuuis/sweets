class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def reserve
    purchase = Purchase.new(status: :waiting)
    params["_json"].map do |param|
      purchase.purchased_product.new(product_id: param[:product_id], quantity: param[:quantity])
    end

    if purchase.save
      render json: purchase, status: :created
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
