class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy 
    has_many :items, through: :cart_items
    #validates :cart_items, uniqueness: true

    # def add_item(item_id)
    #     item = Item.find(item_id)
    #     if item
    #       self.items << item
    #     end
    #     #save
    #   end

   
 end
      