json.partial! 'partial/paginate_meta', object: @moments
json.items @moments do |moment|
  json.(moment, :id, :content, :enabled, :comments_count, :created_time, :updated_time)
  json.attachment_images moment.attachment_images do |attachment_image|
    json.(attachment_image, :id, :file)
  end
end