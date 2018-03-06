json.food_stores @food_stores do |store|
  json.(store, :id, :name, :rank, :comments_count, :per_expense)
  json.logo store.logo.thumb2
  json.region_name store.region.try(:name)
end