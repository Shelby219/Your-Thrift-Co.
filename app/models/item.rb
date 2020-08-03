class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    belongs_to :category


    
    belongs_to :buyer, class_name: "User", optional: true
    belongs_to :seller, class_name: "User"
end
         