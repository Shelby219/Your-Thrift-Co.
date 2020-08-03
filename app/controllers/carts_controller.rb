class CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    helper_method :current_user
    before_action :set_cart
    before_action :authenticate_user!

    
def show   
  #@items = @cart.contained_items
  @items = @cart.list_all_cart
  
end

def edit    
  
  
end

def new
  item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    refresh_cart
    redirect_to cart_path
end

def update
  # @cart.change_quantity(params[:item_id], params[:quantity_change])
  # refresh_cart
  # redirect_to cart_path
end

def destroy
  item = Item.find(params[:item_id])
  @cart.remove_item(item.id)
  refresh_cart
  flash[:notice] = 'Successfully removed ' \
                   "#{view_context.link_to item.title, item_path(item)} " \
                   'from your cart.'
  redirect_to cart_path
end

private
        def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def set_cart
          @cart = Cart.new(session[:cart])
        end


        def refresh_cart
          session[:cart] = @cart.contents
        end
        
        def invalid_cart
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to root_path, notice: 'Invalid cart'
        end
end