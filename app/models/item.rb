class Item < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    belongs_to :category
    #has_and_belongs_to_many :carts
    has_many :carts, dependent: :destroy


    # Change status of product to
  def change_status_to(new_status)
    self.status = new_status
    save
  end
end