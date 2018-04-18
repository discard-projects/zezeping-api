json.item do
  json.(@moment, :id, :content, :enabled, :discussions_count, :views_count, :votes_count, :is_approved, :created_time, :updated_time)
  json.created_time_humane @moment.created_at.to_s(:humane)
  json.attachment_images @moment.attachment_images do |attachment_image|
    json.file_thumb_url attachment_image.file.thumb.url
    json.file_url attachment_image.file.url
  end
  json.store do
    json.(@moment.store, :id, :name)
    json.logo_thumb @moment.store.logo.thumb
  end
end