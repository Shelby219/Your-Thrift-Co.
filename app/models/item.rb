class Item < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:title, :description, :size, :colour, :material, :category_id]

  
    belongs_to :user
    has_many_attached :images   
    belongs_to :category
    has_many :cart_items, dependent: :destroy 
    has_many :carts, through: :cart_items


    has_one :payment
    has_one :review

 #need to validate?  
  validates :title, format: { with: /\A[a-zA-Z0-9 ]*(?:\R[a-zA-Z0-9 ]*)*\z/, :multiline => true, message: "should only contain alpha-numeric characters" }
  validates :description, length: { maximum: 1000, too_long: "1000 character limit, please shorten your description"}
  validates :price, numericality: { only_float: true }
  validates :size, presence: true   
  validates :colour, presence: true
  validates :material, presence: true
  validates :location, presence: true  
  validates :shipping, numericality: { only_float: true }
  validates :category_id, presence: true  
  validates :images, presence: true  




end
         
