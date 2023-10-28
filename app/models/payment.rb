class Payment < ApplicationRecord
  belongs_to :purchase_item
end
