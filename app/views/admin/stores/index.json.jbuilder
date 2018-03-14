json.partial! 'partial/paginate_meta', object: @stores
json.items @stores do |store|
  json.(store, :id, :name, :desc, :comments_count, :rank, :created_time, :updated_time)
  json.category_names store.categories.pluck(:name)
end