class AddPrimaryKeyToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :id, :primary_key, first: true
 end
end
