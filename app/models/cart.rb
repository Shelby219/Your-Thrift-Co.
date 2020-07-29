class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy

    def add_item(item_id)
        current_item = cart_items.find_by(item_id: item_id)
            if current_item
                current_item.quantity += 1 #quantity of cart_item, product in cart
            else
                current_item = cart_items.build(item_id: item_id)
            end
        current_item
    end
end
