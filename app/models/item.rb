class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    belongs_to :category
    has_and_belongs_to_many :carts
 
end  
  