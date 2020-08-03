class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :cart
    validates_uniqueness_of :item_id
end
