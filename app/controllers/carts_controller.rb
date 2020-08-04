class CartsController < ApplicationController
  before_action :authenticate_user!
    before_action :set_cart, only: [:index]
   #before_action :set_cart, only: [:show, :edit, :update, :destroy]
   rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

   def index
   end


end