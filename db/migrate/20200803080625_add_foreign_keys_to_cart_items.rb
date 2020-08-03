class AddForeignKeysToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cart_items, :items, foreign_key: true
    add_foreign_key :cart_items, :carts, foreign_key: true
  end
end
