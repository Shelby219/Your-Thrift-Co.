class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success

    end
    def webhook
         payment_id= params[:data][:object][:payment_intent]
         payment = Stripe::PaymentIntent.retrieve(payment_id)
         item_id = payment.metadata.item_id
         user_id = payment.metadata.user_id
    
         p "listing id " + item_id
         p "user id " + user_id
    
         status 200
     end
  
end