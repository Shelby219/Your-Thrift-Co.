class CreateTableCartItemsAgain < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|

      t.bigint "cart_id", null: false
      t.bigint "item_id", null: false
      t.index ["cart_id", "item_id"], name: "index_cart_items_on_cart_id_and_item_id"
      t.index ["item_id", "cart_id"], name: "index_cart_items_on_item_id_and_cart_id"
    end
  end
end
