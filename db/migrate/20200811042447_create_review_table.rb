class CreateReviewTable < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint "user_id", null: false
      t.bigint "item_id", null: false
      t.integer "rating", default: 0
      t.text "comment", default: false
      t.index ["user_id"], name: "index_reviews_on_user_id"
      end
   end
end
