class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_item
  has_one_attached :image # 1対１(単数枚画像投稿)で関連付けるという宣言

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :Shipping_price
  belongs_to :Prefecture
  belongs_to :Shipping_date
  
end
