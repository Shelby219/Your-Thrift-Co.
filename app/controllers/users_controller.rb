class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :set_user_item, only: [:edit, :update, :destroy]
    #before_action :set_user_payment, only: [:show]
    #before_action :authenticate, only: [:item_payment_history]
    before_action :authenticate_user!
  
  

    def index 
    @users = User.all 
    end
        
    def show     
      @user = User.find_by_id(params[:id]) 
      #@bought_items = current_user.buyer_payments.items
      #@sold_items = current_user.seller_payments

      #BOUGHT ITEMS LIST
      if user_signed_in?
        @bought_items = Array.new
        current_user.buyer_payments.each do |payment|
          @bought_items << payment.item
        end
        @bought_items

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

    def set_user_item
      id = params[:id]
      @item = current_user.items.find_by_id(id)
  
      if @item == nil
          redirect_to item_path
      end
    end

    #def set_user_payment
    #  id = Payment.find(params[:id])
    #  @payment = current_user.payments.find_by_id(id)
    # end
  
end
