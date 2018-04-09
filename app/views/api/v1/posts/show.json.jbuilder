json.item do
  json.(@post, :id, :title, :user_id, :category_id, :content, :views_count, :votes_count, :is_approved, :discussions_count, :collections_count, :is_collected)
  json.created_time_humane @post.created_at.to_s(:humane)

  json.discussions @post.discussions.order(votes_count: :desc) do |discussion|
    json.user do
      json.(discussion.user, :nickname, :image, :id_hash)
    end
    json.(discussion, :id, :content, :discussable_id, :is_approved, :votes_count)
    json.created_time_humane discussion.created_at.to_s(:humane)
  end
end