json.id         @message.id
json.name       current_user.name
json.updated_at @message.updated_at.to_s(:default)
json.body       @message.body
json.image      @message.image.url
