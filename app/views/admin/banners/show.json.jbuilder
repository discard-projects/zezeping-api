json.item do
  json.(@banner, :id, :name, :desc, :link, :enabled, :created_at)
  json.image_thumb @banner.image.thumb
end