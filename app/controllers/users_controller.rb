class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :set_user_item, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index 
    @users = User.all 
    end
        
    def show     
      @user = User.find_by_id(params[:id]) 
      
      #BOUGHT ITEMS LIST
      if user_signed_in?
        @bought_items = Array.new
        current_user.buyer_payments.each do |payment|
          @bought_items << payment.item
        end
        @bought_items

       #SOLD ITEMS LIST- this is just as a record reference
        @sold_items = Array.new
        current_user.seller_payments.each do |sold|
          @sold_items << sold.item
        end
        @sold_items
      end
  
    end  

   
    private
    # Setting the user for updating user details
    def set_user
      @user = User.find(params[:id])
    end

   # Setting the user item 
    def set_user_item
      id = params[:id]
      @item = current_user.items.find_by_id(id)
  
      if @item == nil
          redirect_to item_path
      end
    end
  
end
