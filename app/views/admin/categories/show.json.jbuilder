json.item do
  json.(@category, :id, :name, :enabled, :category, :recommended, :created_at)
  json.logo_thumb @category.logo.thumb
end