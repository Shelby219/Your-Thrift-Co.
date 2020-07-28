class ChangeTable < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :price, :decimal, precision: 10, scale: 2, default: 0.00
    change_column :items, :shipping, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
