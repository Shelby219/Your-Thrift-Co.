class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    
    def success


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

         Item.find(item_id).my_bool = true

         head :ok
         #status 200
     end
  
end