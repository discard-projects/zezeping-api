json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :id, :title, :views_count, :votes_count, :discussions_count, :collections_count)
  json.created_time_humane post.created_at.to_s(:humane)
end