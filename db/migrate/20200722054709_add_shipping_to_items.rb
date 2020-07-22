class AddShippingToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping, :decimal
  end
end
