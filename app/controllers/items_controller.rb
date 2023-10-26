class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_item, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages
      flash[:error] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    # すでに before_action で @item がセットされている
  end

  def edit
    #return unless @item.user_id != current_user.id
    #redirect_to root_path
    # すでに before_action チェック済
    if current_user != @item.user
      redirect_to_root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    # すでに before_action で @item がセットされている
    # すでに before_action チェック済
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :shipping_price_id, :prefecture_id,
                                 :shipping_date_id, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item
    return unless @item.user_id != current_user.id
    redirect_to root_path
  end

end
