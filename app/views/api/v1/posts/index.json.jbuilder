json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :id, :title, :views_count, :votes_count, :discussions_count, :collections_count)
  json.category_name post.category.try(:category_parents_names)
  json.created_time_humane post.created_at.to_s(:humane)
end