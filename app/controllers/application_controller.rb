class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name]) # only parameters necessary on creation
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :name]) # only parameters necessary on log in
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :avatar, :address, :city, :state, :post_code]) #added additional parameters for user account updating. 
    end
    protect_from_forgery with: :exception


  
end
          