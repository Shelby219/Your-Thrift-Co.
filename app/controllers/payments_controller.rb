class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
  
    def success
      redirect_to items_path, notice: 'You have successfully made a payment!'
    end
 
     def webhook   
   p params
          payment_id= params[:data][:object][:payment_intent]
          payment = Stripe::PaymentIntent.retrieve(payment_id)

          item_id = payment.metadata.item_id
          user_id = payment.metadata.user_id
    
          p "item id " + item_id
          p "user id " + user_id

          #this is the creation of a payment via a completed webhook.
           payment = Payment.create(
                buyer_id: user_id, #user who bought the item
                seller_id: Item.find(item_id).user_id, #user who owns the item, taken from item 
                item_id: item_id, #this is the item id from the webhook
                paid: true #webhook successful then paid true
             )
           payment.save
   
          head :ok
         #status 200
      end
  
     def payment_params
      params.require(:payment).permit(:buyer_id, :seller_id, :paid, :item_id )
    end
end


  
