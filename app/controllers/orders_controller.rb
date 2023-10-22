class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @orderform = OrderForm.new
    @item = Item.find(params[:item_id])
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
          @orderform.save(params,current_user.id)
          redirect_to root_path
    else
        @item = Item.find(params[:item_id])
        render :index
    end
  end
      
  private
    def order_params
      params.require(:order_form).permit(:card_number, :expiration_month, :expiration_year, :cvc, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end