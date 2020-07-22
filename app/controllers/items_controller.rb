class ItemsController < ApplicationController
  #before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:show]
  before_action :set_user_item, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
    
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    # if the user is not logged in redirect to the login page
    # else redirect to the item form page
    if user_signed_in?
      # if the user has created a profile show the items form else redirect to creating a profile page
      if current_user.profile
        @item = Item.new
      else
          redirect_to new_user_path
      end
    else
        redirect_to new_user_session_path
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
      @item = current_user.items.create(item_params)
      #@item = Item.new(item_params)
  

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_user_item
      id = params[:id]
      @item = current_user.listings.find_by_id(id)
  
      if @item == nil
          redirect_to item_path
      end
  end
    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :price, :description, :size, :colour, :material, :location, :shipping_price, :decimal)
    end
end
