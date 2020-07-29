class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :category_id, :integer
    add_column :user, :cart_id, foreign_key: true
  end
end
