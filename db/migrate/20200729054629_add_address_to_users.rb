class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
     add_column :users, :address, :string
     add_column :users, :city, :string
     add_column :users, :state, :string
     add_column :users, :post_code, :integer
  end
end
