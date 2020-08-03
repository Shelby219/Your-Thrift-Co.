class CartsController < ApplicationController
  before_action :authenticate_user!
    before_action :set_cart, only: [:index]
   #before_action :set_cart, only: [:show, :edit, :update, :destroy]
   rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

   def index
   end


   
# def show
#   @cart = current_user.cart
# end

# def edit
# end


# def update
#   if @cart.update(cart_params)
#     redirect_to @cart, notice: 'Cart was successfully updated.' 
#   else
#     render :edit 
#   end
# end

# def destroy
#   @cart.destroy if @cart.id == session[:cart_id]
#   session[:cart_id] = nil
#   redirect_to root_path
# end

# private
#         def set_cart
#             @cart = Cart.find(params[:id])
#         end
      
#         def cart_params
#             params[:cart]
#         end

#         def invalid_cart
#         logger.error "Attempt to access invalid cart #{params[:id]}"
#         redirect_to root_path, notice: 'Invalid cart'
#         end
end