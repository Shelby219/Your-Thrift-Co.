class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    #before_action :set_item, only: [:webhook]
    before_action :set_cart, only: [:webhook]
    before_action :set_payment, only: [:webhook]
   
    def success


    end

    def new_payment

      Payment.create(
         buyer_id: current_user.id,
         seller_id: @item.user_id, #@cart.cart_items.item.user.id || # @item.user_id,
         item_id: item_id,
         paid: true
       )

    end
 
    def paid_item

    end

    def webhook
      
         payment_id= params[:data][:object][:payment_intent]
         payment = Stripe::PaymentIntent.retrieve(payment_id)

         
         item_id = payment.metadata.item_id
         user_id = payment.metadata.user_id
    
         p "item id " + item_id
         p "user id " + user_id

         #Item.find(item_id).my_bool = true

         # Payment.create(
         #    buyer_id: current_user.id,
         #    seller_id: @item.user_id, #@cart.cart_items.item.user.id || # @item.user_id,
         #    item_id: item_id,
         #    paid: true
         #  )
         new_payment
         
         head :ok
         #status 200
     end
  
     def set_item
     @item = Item.find_by_id(item_id)
        #@item = Item.find_by(params[:id])
     end

     def set_payment
        @payment = Payment.find(params[:id])
     end

     def set_cart
        @cart = Cart.find(params[:id])
     end

     def payment_params
      params.require(:payment).permit(:buyer_id, :seller_id, :paid, :item_id )
    end
end


  
