class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    before_action :authenticate_user!

def show
  @items = @cart.contained_items
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
  @cart.change_quantity(params[:item_id], params[:quantity_change])
  refresh_cart
  redirect_to cart_path
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

        def refresh_cart
          session[:cart] = @cart.contents
        end
      
    
        def invalid_cart
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to root_path, notice: 'Invalid cart'
        end
end