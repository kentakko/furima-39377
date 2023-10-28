class OrderForm
  include ActiveModel::Model
  attr_accessor :card_number, :expiration_month, :expiration_year, :cvc, :item_id,:user_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token
 
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :token
  end

  validates :building_name, presence: true, allow_blank: true

  def save(params,user_id)
  purchase_item = PurchaseItem.create(item_id: params[:item_id], user_id: user_id)
  Payment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_item: purchase_item)
  end
end