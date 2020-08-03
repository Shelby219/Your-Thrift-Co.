class CreateJoinTableCartItem < ActiveRecord::Migration[6.0]
  def change
    create_join_table :carts, :items do |t|
       t.index [:cart_id, :item_id]
       t.index [:item_id, :cart_id]
    end
  end
end
