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

  #has_many :items_to_buy, class_name: "Item", foreign_key: "buyer_id", dependent: :destroy #referring to same table with different key - self ref
  #has_many :tems_to_sell, class_name: "item", foreign_key: "seller_id", dependent: :destroy #destroys posts if user is destroyed

  has_many :buyer_payments, foreign_key: "buyer_id", class_name: "Payment"
  has_many :seller_payments, foreign_key: "seller_id", class_name: "Payment"

end
               
