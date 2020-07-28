class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    belongs_to :category

   # has a title, content, and otherwise throw an error.
   #validates :title, :price, :description, :size, :colour. :material, :location, :shipping, :category_id, presence: true
    #validate the associated record “category” is present
   has_many :line_items, inverse_of: :order
end
