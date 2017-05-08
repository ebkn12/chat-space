json.(@message, :id, :body, :image, :updated_at)

json.user do
  json.name current_user.name
end