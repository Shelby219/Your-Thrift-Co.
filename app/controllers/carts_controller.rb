class CartsController < ApplicationController
    before_action :item_id
    before_action :authenticate_user!
   
    
    def new
      item = Item.find(params[:item_id])
      
      @cart.add(item_id) 

      redirect_to cart_path

   end

    def show  
      @items = Item.find(@cart)
    end

   def destroy

      @cart.delete_at(params[:index].to_i)

      redirect_to cart_path
   end

    private
   def item_id
    item = Item.find(params[:item_id])
   end

end