class AddUniqueToItemId < ActiveRecord::Migration[6.0]
  def change
    change_column :cart_items, :item_id, :bigint, unique: true
  end
end
