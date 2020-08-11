class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:create]
  before_action :set_cart_user, only: [:show, :create, :destroy]
   
   def show
  
   end   
   
   def create
    #checking if cart items already include the item in the parameters. Then notifying if already in bag so double up does not happen.
     if @cart.items.include?(@item)
       redirect_to mycart_path, notice: 'Item Already In Bag.' 
  
      else 
      #if not the item gets added to cart items for viewing. 
      @cart.items << @item
       redirect_to mycart_path, notice: 'Item Added to Bag.' 
      end
      
  end

  def destroy
     #enabling deletion of a cart item. That does not affect an item. 
    @cart.cart_items.delete(params[:item_id])
    @cart.save
    redirect_to mycart_path, notice: 'Item Removed from Bag.' 
  end

  private
      #setting the cart item ready for usage
      def set_cart_item
        @item = Item.find(params[:item_id])
      end

     #setting the cart ready for using. Creating a new cart for new user accounts. Loading the users account when signing in. 
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

