class CartItemsController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:create] #before create, execute :set_cart, find(or create) cart
    before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  def index
    @cart_items = CartItem.all
  end

  def show
  end
  
  def new
    @cart_item = CartItem.new
  end


  def edit
  end
  
  def create
  item = Item.find(params[:item_id])
  @cart_item = @cart.add_item(item.id)
    if @cart_item.save
      redirect_to current_user.cart 
    else
      render :new 
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item, notice: 'Cart item was successfully updated.' 
    else
      render :edit 
    end
  end
  
  def destroy
   @cart_item.destroy
    redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' 
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end 

    def cart_item_params
        params.require(:cart_item).permit(:item_id)
    end
end
    