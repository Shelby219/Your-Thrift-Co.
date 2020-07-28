class CreateShoppingBags < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_bags do |t|

      t.timestamps
    end
  end
end
