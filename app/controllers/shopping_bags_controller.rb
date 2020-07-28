class ShoppingBagsController < ApplicationController
  before_action :set_shopping_bag, only: [:show, :edit, :update, :destroy]
  before_action :set_user_shopping_bag, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /shopping_bags
  # GET /shopping_bags.json
  def index
    @shopping_bags = ShoppingBag.all
  end

  # GET /shopping_bags/1
  # GET /shopping_bags/1.json
  def show
    if 
  end

  # GET /shopping_bags/new
  def new  
    if user_signed_in?
      if current_user.id
        @shopping_bag = ShoppingBag.new
      else
          redirect_to new_user_path
      end
    else
        redirect_to new_user_session_path
    end
  end

  # GET /shopping_bags/1/edit
  def edit
  end

  # POST /shopping_bags
  # POST /shopping_bags.json
  def create
    #@shopping_bag = ShoppingBag.new(shopping_bag_params)
    @shopping_bag = current_user.shopping_bags.create(shopping_bag_params)
    respond_to do |format|
      if @shopping_bag.save
        format.html { redirect_to @shopping_bag, notice: 'Shopping bag was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_bag }
      else
        format.html { render :new }
        format.json { render json: @shopping_bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_bags/1
  # PATCH/PUT /shopping_bags/1.json
  def update
    respond_to do |format|
      if @shopping_bag.update(shopping_bag_params)
        format.html { redirect_to @shopping_bag, notice: 'Shopping bag was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_bag }
      else
        format.html { render :edit }
        format.json { render json: @shopping_bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_bags/1
  # DELETE /shopping_bags/1.json
  def destroy
    @shopping_bag.destroy
    respond_to do |format|
      format.html { redirect_to shopping_bags_url, notice: 'Shopping bag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_bag
      @shopping_bag = ShoppingBag.find(params[:id])
    end

    def set_user_shopping_bag
      id = params[:id]
      @shopping_bag = current_user.shopping_bags.find_by_id(id)
  
      if @shopping_bag == nil
          redirect_to root_path
      end
    end
    # Only allow a list of trusted parameters through.
    def shopping_bag_params
      params.fetch(:shopping_bag, {})
    end
end
