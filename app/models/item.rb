class Item < ApplicationRecord

  include PgSearch::Model

  
    belongs_to :user
    has_many_attached :images
    belongs_to :category
    has_many :cart_items, dependent: :destroy 
    has_many :carts, through: :cart_items

    #belongs_to :buyer, class_name: "User", optional: true 
   # belongs_to :seller, class_name: "User"
    has_one :payment

 #need to validate?
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :colour, presence: true
  validates :material, presence: true
  validates :location, presence: true  
  validates :shipping, presence: true  
  validates :category_id, presence: true  
  validates :images, presence: true  




end
         
