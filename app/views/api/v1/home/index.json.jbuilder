json.food_stores @food_stores do |store|
  json.(store, :id, :name, :rank, :comments_count, :per_expense, :logo)
  json.region_name store.region.try(:name)
end