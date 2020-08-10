class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:create]
  #before_action :set_cart_item_owner, only: [:show]
  before_action :set_cart_user, only: [:show, :create, :destroy]
   
   def show
  
   end

   def create
     if @cart.items.include?(@item)
       redirect_to mycart_path, notice: 'Item Already In Bag.' 
  
      else 
      @cart.items << @item
       redirect_to mycart_path, notice: 'Item Added to Bag.' 
      end
      
  end

  def destroy
    @cart.cart_items.delete(params[:item_id])
    @cart.save
    redirect_to mycart_path, notice: 'Item Removed from Bag.' 
  end

  private
   
      def set_cart_item
        @item = Item.find(params[:item_id])
      end

      #def set_cart_item_owner
     #   item = Item.find(params[:item_id])
      #  @username = item.user.username
     # end

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

