class CartsController < ApplicationController
    #rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

    #helper_method :current_user
   
    before_action :authenticate_user!
    before_action :set_cart

    def show
      # Get shopping cart items
      @cart = current_user.cart if !current_user.cart.blank?
    end


  def create
    # Get the product id
    @cart = current_user.cart.create(params)
    cart_item = params.require(:cart)[:item_id]
    # Find the product id
    item = Item.find(cart_item)

    # Find the shopping cart
    @cart = current_user.cart unless current_user.cart.blank?
    if current_user.cart.blank?
      @cart = Cart.new(current_user)
    end
    # Add product to shopping cart
    @cart.add_item(item)
    # Change product status to Reserved
    item.change_status_to('Reserved')
    redirect_to carts_url
  end

 
  def destroy
    # Get the product id
    cart_item = params.permit(:id)[:id]
    # Find the product id
    item = Item.find(cart_item)
    # Delete product id from shopping_cart
    current_user.cart.remove_item(item)
    # Set product status to Available
    item.change_status_to('Available')

    redirect_to carts_url
  end


 
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart
          #@cart = Cart.find(params[:id])
          @cart = Cart.find_by_id(params[:id]) || @cart = Cart.create(params[:id])
        end
         def set_cart
           @cart = Cart.new(session[:cart])
         end
  
end