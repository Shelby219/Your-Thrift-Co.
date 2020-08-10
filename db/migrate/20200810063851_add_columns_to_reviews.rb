class AddColumnsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :user, null: false, foreign_key: true
    remove_column :reviews, :buyer_id, :integer
    remove_column :reviews, :seller_id, :integer
  end
end
