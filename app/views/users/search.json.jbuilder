users.each do |user|
  json.name              user.name
  json.current_user_name current_user.name
  json.id                user.id
end

