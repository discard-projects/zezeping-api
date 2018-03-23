json.categories @store.categories do |category|
  json.(category, :id, :name, :created_time, :updated_time)

  json.ancestors category.ancestors do |ancestor|
    json.(ancestor, :id, :name, :created_time, :updated_time)
  end

  json.product_categories category.product_categories do |product_category|
    json.(product_category, :id, :name)

    json.products product_category.products do |product|
      json.(product, :id, :name, :price, :rank)
      json.image_thumb product.image.thumb
      json.product_category_id product_category.id
    end
  end
end