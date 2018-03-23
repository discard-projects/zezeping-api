json.items @product_categories do |product_category|
  json.(product_category, :id, :name)
end
