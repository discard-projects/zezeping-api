json.partial! 'partial/paginate_meta', object: @stores
json.items @stores do |store|
  json.(store, :id, :name, :rank, :comments_count, :per_expense)
  json.distance store.try(:distance) || @loc && store.try(:distance_from, [@loc['lat'], @loc['lng']]) || 0
  json.logo store.logo.thumb
  json.region_name store.region.try(:name)
  json.category_names store.categories.pluck(:name)
end