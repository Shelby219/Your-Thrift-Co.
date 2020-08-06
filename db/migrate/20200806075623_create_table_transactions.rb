class CreateTableTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.bigint "buyer_id", null: false
      t.bigint "seller_id", null: false
      t.boolean "paid", default: false
      t.bigint "item_id", null: false

      t.index ["buyer_id"], name: "index_payments_on_buyer_id"
      t.index ["seller_id"], name: "index_payments_on_seller_id"
    end

  end

  
end
