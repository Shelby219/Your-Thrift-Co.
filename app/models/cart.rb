class Cart < ApplicationRecord
    belongs_to :user
    #has_and_belongs_to_many :items
    has_many :cart_items
    has_many :items, through: :cart_items, dependent: :destroy


    # Add product to shopping cart
  def add_item(item)
    items << item
    # save
  end

  # Remove product from shopping cart
  def remove_item(item)
    items.delete(item)
    # save
  end

  # Access a product from cart
  def item(item)
    items.find(item.id)
  end

  # Check if product already added in cart
  def includes_item?(item)
    items.include?(item)
  end

end
      