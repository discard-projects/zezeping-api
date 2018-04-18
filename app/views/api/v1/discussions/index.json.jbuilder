json.partial! 'partial/paginate_meta', object: @discussions
json.items @discussions do |discussion|
  json.user do
    json.(discussion.user, :nickname, :image, :id_hash, :created_time)
  end
  json.(discussion, :id, :content, :discussable_id, :is_approved, :votes_count)
  json.created_time_humane discussion.created_at.to_s(:humane)
end