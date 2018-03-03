json.item do
  json.(@shop, :id, :name, :desc, :category_id, :attachment_image_ids, :region_id, :created_at)
  json.logo_url @shop.logo
  json.attachment_images @shop.attachment_images do |attachment_image|
    json.(attachment_image, :id, :file)
  end
  json.shop_detail do
    json.phones @shop.shop_detail.phones
  end
end