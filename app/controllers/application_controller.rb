class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :set_cart
# helper_method :current_cart


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :avatar, :address, :city, :state, :post_code])
    end
    protect_from_forgery with: :exception

  # private
  #   def set_cart
  #     @cart = Cart.find(session[:cart_id])
  #     rescue ActiveRecord::RecordNotFound
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
    
  #   def current_cart
  #     if !session[:cart_id].nil?
  #       Cart.find(session[:cart_id])
  #     end
  #   end

end
          