class ChargesController < ApplicationController
    before_action :set_item, only: [:show]

    def new
    end
    
    def create
      # Amount in cents
      @amount = 500
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        name: @item.title,
        amount: @amount,
        description: @item.description,
        currency: 'aud',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end


    private
    def set_item
      @item = Item.find(params[:id])
    end

end
