class AddForeignKeyToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key "cart_items", "carts"
    add_foreign_key "cart_items", "items"
  end
end
