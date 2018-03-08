json.partial! 'partial/paginate_meta', object: @comments
json.items @comments do |comment|
  json.(comment, :id, :content, :anonymous, :rank, :rank_taste, :rank_env, :rank_service, :created_time, :updated_time)
  json.user do
    json.id_hash Digest::SHA1.hexdigest("#{comment.user.id}")
    if comment.anonymous
      json.nickname comment.user.sec_email
    else
      json.image comment.user.image
      json.nickname comment.user.nickname || comment.user.name
    end
  end
  json.attachment_images comment.attachment_images do |attachment_image|
    json.file_thumb attachment_image.file.thumb
    json.file_small attachment_image.file.small
  end
end