class Cart < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :items


  attr_accessor :contents

  def initialize(initial_contents)
    @contents = Array.new
  end   
 
  def add_item(item_id)
    @contents<<item_id
  end

  def remove_item(item_id)
    @contents.delete(item_id)
  end

  def list_all_cart
    @contents.map do |item_id|
      items.find_by(item_id)
    end
  end

  # def initialize(initial_contents)
  #   @contents = initial_contents || Hash.new(0)
  # end
      
  # def add_item(item_id)
  #   contents[item_id.to_s] || 0
  #   contents[item_id.to_s] += 1
  # end

  # def remove_item(item_id)
  #   contents.delete(item_id.to_s)
  # end

  # def total
  #   contents.reduce(0) do |total, (item_id, quantity)|
  #     item = items.find(item_id)
  #     total += (item.price * quantity)
  #     total
  #   end
  # end

  # def change_quantity(item_id, quantity)
  #   contents[item_id.to_s] += quantity.to_i
  #   remove_item(item_id) if contents[item_id.to_s] <= 0
  # end

  # def contained_items
  #   contents.map do |item_id, quantity|
  #     [items.dig(item_id), quantity]
  #   end.to_h
  # end
    
end
      