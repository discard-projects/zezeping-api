json.categories @categories do |category|
  json.(category, :id, :name)
end

json.banners @banners do |banner|
  json.(banner, :id, :link, :image, :desc)
end