json.categories @categories do |category|
  json.(category, :id, :name)
  json.logo_thumb category.logo.thumb
end

json.banners @banners do |banner|
  json.(banner, :id, :link, :image, :desc)
end