class ReviewsController < ApplicationController
  #before_action :set_item, only: [:new]
  before_action :set_review, only: [:show, :destroy]
  before_action :authenticate_user!
  
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to user_path(current_user), notice: 'Review created' 
    else
      flash[:alert] = "Could not create review"
      render 'new'
    end
  end

  def show
  end

  def destroy
    #finds the item attached the particular review.
    item = @review.item
    @review.destroy
    redirect_to user_path(current_user), notice: 'Review deleted' 
  end

private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def review_params
        params.require(:review).permit(:user_id, :item_id, :comment, :rating)
    end

    def set_review
      #finds the review using the sent through ID in parameters
      @review = Review.find(params[:id])
    end

end















    # before_action :set_item
    # before_action :set_buyer, only: [:new, :create]
    # before_action :set_seller, only: [:new, :create]
    # before_action :authenticate_user!


    # def new
    #   @review = Review.new
    # end

    # def create
    #     @review = Review.create(review_params)
    #     redirect_to user_path(current_user), notice: 'Review created' 
    # end

    # def destroy
    #   @review.destroy    
    #   redirect_to user_path(current_user), notice: 'Review deleted' 
    # end

    # private
    #     # Use callbacks to share common setup or constraints between actions.
    #     def set_item
    #       @item = Item.find(params[:item_id])
    #     end
        
    #     def set_buyer
    #       if @item.payment != nil && @item.payment.paid == true 
    #       @item_buyer = @item.payment.buyer_id
    #       end
    #     end

    #     def set_seller
    #         if @item.payment != nil && @item.payment.paid == true 
    #           @item_seller = @item.payment.seller_id
    #         end 
    #     end
        
    #     def review_params
    #         params.require(:review).permit(:buyer_id, :seller_id, :item_id, :comment, :rating)
    #     end

