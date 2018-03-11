json.partial! 'partial/paginate_meta', object: @stores
json.items @stores do |store|
  json.(store, :id, :name, :rank, :comments_count, :per_expense)
  json.logo store.logo.thumb2
  json.region_name store.region.try(:name)
  json.category_names store.categories.pluck(:name)
end