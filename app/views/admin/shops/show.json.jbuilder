json.item do
  json.(@shop, :id, :name, :desc, :category_id, :region_id, :created_at)
  json.logo_url @shop.logo
  json.shop_detail do
    json.phones @shop.shop_detail.phones
  end
end