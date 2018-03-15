json.partial! 'partial/paginate_meta', object: @moments
json.items @moments do |moment|
  json.(moment, :id, :content, :enabled, :comments_count, :created_time, :updated_time)
  json.attachment_images moment.attachment_images do |attachment_image|
    json.file_thumb_url attachment_image.file.thumb.url
    json.file_url attachment_image.file.url
  end
  json.store do
    json.(moment.store, :id, :name)
    json.logo_thumb moment.store.logo.thumb
  end
end