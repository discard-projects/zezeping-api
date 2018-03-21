json.item do
  json.(@current_user, :id, :nickname, :email)
  json.store_id @current_user.try(:store).try(:id)
end
