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

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_price_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" } 
  
  #バリデーション
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true

end
