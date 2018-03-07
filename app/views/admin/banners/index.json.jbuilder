json.partial! 'partial/paginate_meta', object: @banners
json.items @banners do |banner|
  json.(banner, :id, :name, :desc, :link, :image, :enabled, :created_time, :updated_time)
end