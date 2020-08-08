class RemoveBuyerAndSellerFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :buyer_id, :integer
    remove_column :items, :seller_id, :integer
  end
end
