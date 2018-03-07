json.item do
  json.(@store, :id, :name, :desc, :category_id, :attachment_image_ids, :region_id, :created_at)
  json.logo_thumb @store.logo.thumb
  json.store_detail do
    json.rank_taste @store.store_detail.rank_taste
    json.rank_env @store.store_detail.rank_env
    json.rank_service @store.store_detail.rank_service
    json.phones @store.store_detail.phones
    json.wechat_qrcode_thumb @store.store_detail.wechat_qrcode.thumb
  end
  json.attachment_images @store.attachment_images do |attachment_image|
    json.(attachment_image, :id, :file)
  end
end