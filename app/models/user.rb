class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one_attached :avatar
  has_one :cart
  
  #has_many :items_to_buy, class_name: "Item", foreign_key: "buyer_id"
  #has_many :items_to_sell, class_name: "Item", foreign_key: "seller_id"

  

end
          
