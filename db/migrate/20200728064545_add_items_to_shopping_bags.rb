class AddItemsToShoppingBags < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_bags, :item_id, :integer
    add_column :shopping_bags, :user_id, :integer
  end
end
