class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_item
  has_one_attached :image # 1対１(単数枚画像投稿)で関連付けるという宣言

end
