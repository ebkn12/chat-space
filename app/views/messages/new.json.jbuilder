json.(@messages) do |message|
  json.name       message.user.name
  json.updated_at message.updated_at.to_s(:default)
  json.body       message.body
  json.image      message.image.url
end

