json.item do
  json.(@category, :id, :name, :enabled, :recommended, :created_at)
  json.logo_thumb @category.logo.thumb
end