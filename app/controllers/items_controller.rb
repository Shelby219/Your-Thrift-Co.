class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :set_user_item, only: [:edit, :update, :destroy]
  before_action :set_payment, only: [:show, :index]
  before_action :authenticate_user!
  
 
    
  # GET /items       
  # GET /items.json
  def index
    @items = Item.all
    #enabling the items to be categorised
    if params[:category].blank?
      @items = Item.all.order('created_at DESC')
      else
      @category_id = Category.find_by(name: params[:category]).id
      @items = Item.where(category_id: @category_id).order('created_at DESC')
      end
      #@categories = Category.all.name

      #if @payment.buyer_id == @item.buyer_id
     #   @paid = true 
     # end
  end

  # GET /items/1    
  # GET /items/1.json
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      billing_address_collection: 'required',
      shipping_address_collection: {
      allowed_countries: ['AU'],
  },
      line_items: [{
          name: @item.title, 
          description: @item.description,
          amount: ((@item.price + @item.shipping) * 100).to_i,
          currency: 'aud',   
          quantity: 1,
      }],   
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              item_id: @item.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&itemId=#{@item.id}",
      cancel_url: "#{root_url}items"
  )
  #Session ID for stripe 
  @session_id = session.id

    @item.payment
      #if @payment.buyer_id == @item.buyer_id
      #  @paid = true 
      #end
   
  end

  # GET /items/new
  def new
    # If the user is logged in it will redirect to a new listing form, else it will redirect to sign up
    if user_signed_in?
      if current_user.id
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
      @item = current_user.items.find_by_id(id)
  
      if @item == nil
          redirect_to item_path
      end
    end
    
    def set_payment
      @payment= Payment.find_by_id(params[:item_id])
     end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :price, :description, :size, :colour, :material, :location, :shipping, :category_id, :buyer_id, :seller_id, images: [] )
    end
end
