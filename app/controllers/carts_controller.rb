class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:create]
  before_action :set_cart, only: [:show, :create, :destroy]
  before_action :set_cart_user, only: [:show, :create, :destroy]

   def show
      #if user_signed_in? && current_user.cart 
      #  @cart = current_user.cart
     # else
       # redirect_to items_path
    #end
   end

  def create
    #if !current_user.cart
    #  cart = Cart.create(user_id: current_user.id)
    #else
    #  cart = current_user.cart
    # end
     if @cart.items.include?(@item)
       redirect_to mycart_path, notice: 'Item Already In Bag.' 
  
      else 
      @cart.items << @item
       redirect_to mycart_path, notice: 'Item Added to Bag.' 
      end
      
  end

  def destroy
    #cart = current_user.cart
    @cart.cart_items.delete(params[:item_id])
    @cart.save
    redirect_to mycart_path
  end

  private
   
      def set_cart_item
        @item = Item.find(params[:item_id])
      end

      def set_cart
      
      end

      def set_cart_user
         if user_signed_in? && current_user.cart 
           @cart = current_user.cart
         else !current_user.cart
           @cart = Cart.create(user_id: current_user.id)
         end
       end

       def cart_item_params
        params.require(:cart_item).permit(:item_id, :cart_id)
       end

end


#   before_action :authenticate_user!
#   before_action :set_cart_item, only: [:create]
#   before_action :set_cart, only: [:show, :create, :destroy]
#   before_action :set_cart_user, only: [:show, :create, :destroy]

#    def show
#       #if user_signed_in? && current_user.cart 
#        # @cart = current_user.cart
#       #else
#        # redirect_to items_path
#       #end
#    end

#   def create

#      @cart.items << @item
#      redirect_to mycart_path

#   end

#   def destroy
#     @cart.cart_items.delete(params[:id])
#     @cart.save
#     redirect_to mycart_path
#   end

#   private

#       def set_cart_user
#         if user_signed_in? && current_user.cart 
#           @cart = current_user.cart
#         else
#           @cart = Cart.create(user_id: current_user.id)
#         end
#       end

#       def set_cart_item
#         @item = Item.find(params[:item_id])
#       end

#       def set_cart_item_
      
#       end

#        def cart_item_params
#         params.require(:cart_item).permit(:item_id, :cart_id)
#        end

# end