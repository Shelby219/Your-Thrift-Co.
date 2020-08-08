class PaymentsController < ApplicationController
    #before_action :set_item, only: [:webhook]
    skip_before_action :verify_authenticity_token, only: [:webhook]
   
    #before_action :set_cart, only: [:webhook]
   #before_action :set_payment, only: [:webhook]
   
    def success


    end
 
     def webhook
   p params
          payment_id= params[:data][:object][:payment_intent]
          payment = Stripe::PaymentIntent.retrieve(payment_id)

         
          item_id = payment.metadata.item_id
          user_id = payment.metadata.user_id
    
          p "item id " + item_id
          p "user id " + user_id

          #Item.find(item_id).my_bool = true
    #       @item = Item.find(item_id).user_id

           payment = Payment.create(
                buyer_id: user_id, #user who bought the item
                seller_id: Item.find(item_id).user_id, #user who owns the item, taken from item 
                item_id: item_id, #this is the item id from the webhook
                paid: true #webhook successful then paid true
             )
           payment.save
   
          head :ok
   #       #status 200
      end
  
     #def set_cart
     #   @cart = Cart.find(params[:id])
     #end

     def payment_params
      params.require(:payment).permit(:buyer_id, :seller_id, :paid, :item_id )
    end
end


  
