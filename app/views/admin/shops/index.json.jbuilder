json.partial! 'partial/paginate_meta', object: @shops
json.items @shops do |shop|
  json.(shop, :id, :name, :desc, :comments_count, :rank, :created_time, :updated_time)
end