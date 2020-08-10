class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint "buyer_id", null: false
      t.bigint "seller_id", null: false
      t.bigint "item_id", null: false
      t.integer "rating", default: false
      t.text "comment", default: false
     
      t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
      t.index ["seller_id"], name: "index_reviews_on_seller_id"
      t.timestamps
    end
  end
end
