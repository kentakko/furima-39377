class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id,:user_id, :post_code, :prefecture_id, :city, :adress, :building_name, :phone_number
 
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end

  def save(params,user_id)
  purchase_item = Purchase_item.create(item_id: params[:item_id], user_id: user_id)
  payment.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end

end