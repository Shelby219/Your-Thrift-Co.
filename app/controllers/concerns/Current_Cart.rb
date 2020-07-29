module CurrentCart
    extend ActiveSupport::Concern
    
    private
     def set_cart
      @cart = current_user.cart || current_user.create_cart
      session[:cart_id] = @cart.id
     end
    end