json.item do
  json.(@moment, :id, :store_id, :content, :enabled, :attachment_image_ids, :comments_count, :created_at)
  json.attachment_images @moment.attachment_images do |attachment_image|
    json.(attachment_image, :id, :file)
  end
end