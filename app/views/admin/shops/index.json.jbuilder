json.partial! 'partial/paginate_meta', object: @shops
json.items @shops do |shop|
  json.(shop, :id, :name, :created_time, :updated_time)
end