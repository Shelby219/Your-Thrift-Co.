class UsersController < ApplicationController

before_action :authenticate_user!
  
    # def index 
    # @users = User.all 
    # end
  
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

    def reviews

      @user = User.find(params[:id])
            #The users items list of reviews accessed via the item. 
      user_items = Item.where(user: @user)
      @user_reviews = Review.where(item: user_items)
      
      #  @user_reviews = Array.new
      #  @user.items.each do |item|
      #    if item.review.nil?
      #    @user_reviews << item.review
      #    end
      #  end
      #  @user_reviews
    end


    private
     # Setting the user for updating user details
     def set_user
       @user = User.find(params[:id])
     end

  
end
