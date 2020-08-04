class Cart < ApplicationRecord
    #belongs_to :user
    has_many :cart_items

        def add_item(item_params)
            current_product = cart_items.find_by(item_id: item_params[:item][:item_id])

            if current_product
            current_product.save
            else
            new_product = cart_items.create(item_id: item_params[:item][:item_id], cart_id: self.id)
            end
            new_product
        end

        #  def remove_from_cart(item_params)
        #       current_product = cart_items.find_by(item_id: item_params[:item][:item_id])
        #       cart_items.remove(current_product)
        
        #   end

 end
      