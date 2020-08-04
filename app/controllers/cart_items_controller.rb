class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item, only: [ :destroy]

  before_action :authenticate_user!

 
  def create   
    #unless  current_user.id == @item.user_id
     @cart.add_item(params)
    #else
     # format.html { redirect_to @item, notice: 'Not allowed to add to cart' }
      if @cart.save
        redirect_to cart_path
      else
        redirect_to @item
      end
    #end
  end

  def destroy
    #current_product = @cart_item.find_by(item_id:[:item_id])
    #@cart_item.delete(current_product)
    #@cart.remove_from_cart(params)
    @cart_item.destroy
    redirect_to cart_path
  
  end

  private
      def current_cart 
        @current_cart = Cart.find(session[:cart_id])
      end
      
      def set_cart_item
        @cart_item = CartItem.find_by(params[:item_id])
      end

       def cart_item_params
        params.require([:item_id, :cart_id])
       end


end
      