class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
helper_method :current_user
before_action :set_cart

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :avatar])
    end
    protect_from_forgery with: :exception


    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def set_cart
      @cart = Cart.new(session[:cart])
    end

end  
