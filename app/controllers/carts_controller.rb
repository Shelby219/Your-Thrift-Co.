class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:create]
  before_action :set_cart, only: [:show, :create, :destroy]
  

   def show
      if user_signed_in? && current_user.cart 
        @cart = current_user.cart
      else
        redirect_to items_path
    end
   end

  def create
    if !current_user.cart
      cart = Cart.create(user_id: current_user.id)
    else
      cart = current_user.cart
     end

     cart.items << @item

     redirect_to mycart_path

  end

  def destroy
    cart = current_user.cart
    cart.cart_items.delete(params[:item_id])
    cart.save
    redirect_to mycart_path
  end

  private

      def set_cart_user

      end

      def set_cart_item
        @item = Item.find(params[:item_id])
      end

      def set_cart
      
      end


      # def current_cart 
      #   @current_cart = Cart.find(session[:cart_id])
      # end
      
      # def set_cart_item
      #   @cart_item = CartItem.find(params[:id])
      #  # @cart_item = CartItem.find_by(params[:item_id])
      # end

       def cart_item_params
        params.require(:cart_item).permit(:item_id, :cart_id)
        #params.require([:item_id, :cart_id])
       end

end