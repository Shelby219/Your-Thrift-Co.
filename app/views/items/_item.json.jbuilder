json.extract! item, :id, :title, :price, :description, :size, :colour, :material, :location, :shipping_price, :decimal, :created_at, :updated_at
json.url item_url(item, format: :json)
