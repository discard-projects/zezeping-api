json.item do
  json.(@store, :id, :name, :desc, :category_id, :attachment_image_ids, :phones, :region_id, :created_at)
  json.logo_url @store.logo
  json.attachment_images @store.attachment_images do |attachment_image|
    json.(attachment_image, :id, :file)
  end
end