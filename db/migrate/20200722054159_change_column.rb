class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :shipping_price
   remove_column :items, :decimal
  end
end
