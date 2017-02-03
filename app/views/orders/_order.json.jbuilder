json.extract! order, :id, :name, :message, :email, :phone, :created_at, :updated_at
json.url order_url(order, format: :json)