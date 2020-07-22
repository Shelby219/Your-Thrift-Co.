class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :size
      t.string :colour
      t.string :material
      t.string :location
      t.string :shipping_price
      t.string :decimal

      t.timestamps
    end
  end
end
