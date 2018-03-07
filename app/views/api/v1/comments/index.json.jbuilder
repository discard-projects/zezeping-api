json.partial! 'partial/paginate_meta', object: @comments
json.items @comments do |comment|
  json.(comment, :id, :content, :rank, :rank_taste, :rank_env, :rank_service, :created_time, :updated_time)
  json.user do
    json.image comment.user.image
    json.name comment.user.name
    json.nickname comment.user.nickname
  end
  json.attachment_images comment.attachment_images do |attachment_image|
    json.file_thumb attachment_image.file.thumb
    json.file_small attachment_image.file.small
  end
end