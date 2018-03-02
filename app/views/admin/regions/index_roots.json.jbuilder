json.partial! 'partial/paginate_meta', object: @regions
json.items @regions do |region|
  json.(region, :id, :name, :created_time, :updated_time)
  json.children region.children do |region|
    json.(region, :id, :name, :created_time, :updated_time)
  end
end