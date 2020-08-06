class AddForeignKeyToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :payments, :items
    add_foreign_key :payments, :users, column: :buyer_id
    add_foreign_key :payments, :users, column: :seller_id
  end
end
