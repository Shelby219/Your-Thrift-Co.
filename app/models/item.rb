class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    belongs_to :category
    has_many :cart_items, dependent: :destroy 
    has_many :carts, through: :cart_items
end
         
