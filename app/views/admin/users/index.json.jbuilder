json.partial! 'partial/paginate_meta', object: @users
json.items @users do |user|
  json.(user, :id, :nickname, :email)
  json.nickname_email_name "#{user.nickname}-#{user.email}-#{user.name}"
end