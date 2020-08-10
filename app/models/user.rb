class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_presence_of :username
         validates_uniqueness_of :username, :uniqueness => true
         validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
         validate :validate_username

      
         def validate_username
          if User.where(email: username).exists?
            errors.add(:username, :invalid)
          end
        end

  has_many :items, dependent: :destroy
  has_one_attached :avatar
  has_one :cart

  has_many :buyer_payments, foreign_key: "buyer_id", class_name: "Payment"
  has_many :seller_payments, foreign_key: "seller_id", class_name: "Payment"


  has_many :reviews
end
               
