class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :set_user_item, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def index 
    @users = User.all 
    end

    def show   
      @user = User.find_by_id(params[:id]) 
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
  
end
