class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @orderform = OrderForm.new
    if current_user == @item.user
      redirect_to root_path
    else
      #商品が売却済の場合もトップへリダイレクト
      if @item.purchase_item.present?
        redirect_to root_path
      end
    end
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 直接PAY.JPテスト秘密鍵の指定から環境変数へ
      item_price = @item.price #商品の金額を取得
      
      Payjp::Charge.create(
        amount: item_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
        @orderform.save(params,current_user.id)
        redirect_to root_path
    else
        render :index
    end
  end
      
  private
    def order_params
      params.require(:order_form).permit(:card_number, :expiration_month, :expiration_year, :cvc, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end