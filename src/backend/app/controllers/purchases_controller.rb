require 'net/http'
require 'uri'
class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def reserve
    purchase = Purchase.new(status: :waiting)
    params["_json"].map do |param|
      purchase.purchased_product.new(product_id: param[:product_id], quantity: param[:quantity])
    end

    if purchase.save
      fetch_api('http://' + ENV.fetch('IDM_READER_HOST_NAME') + '/api/v1/purchase', purchase.to_json,)
      render json: purchase, status: :created
    else
      render json: { errors: purchase.errors }, status: :unprocessable_entity
    end
  end

  def create
    purchase = Purchase.find(params[:body][:purchase_id])
    user = User.find(Idm.find_by(value: params[:body][:idm]).user_id)
    if purchase && user
      purchase.user_id = user.id
      purchase.status = :success
      if purchase.save
        render json: purchase, status: :created
      else
        render json: { errors: purchase.errors }, status: :unprocessable_entity
      end
    end
  end

  def show
    purchase = Purchase.find(params[:id])
    render json: purchase, status: :ok
  end

  def fetch_api(url, data)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = 'application/json'
    req.body = data
    res = http.request(req)
    # TODO レスポンスエラー処理
  end
end
