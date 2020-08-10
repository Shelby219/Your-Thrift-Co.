class UsersController < ApplicationController

    before_action :set_user, only: [:show, :reviews, :edit, :update, :destroy]
    before_action :reviews, only: [:show, :reviews]
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

        @sold_items = Array.new
        current_user.seller_payments.each do |sold|
          @sold_items << sold.item
        end
        @sold_items
      end
    end  

    def reviews
      @user_reviews = Array.new
      @user.items.each do |item|
        @user_reviews << item.review
      end
      @user_reviews
    end


    private
        # Setting the user for updating user details
        def set_user
          @user = User.find(params[:id])
        end
  
end
