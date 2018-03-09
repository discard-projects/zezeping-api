json.item do
  json.(@store, :id, :name, :desc, :comments_count, :per_expense, :address, :rank, :attachment_image_ids, :region_id, :created_at)
  json.category_names store.categories.pluck(:name)
  json.logo_url @store.logo.thumb.url
  json.store_detail do
    json.rank_taste @store.store_detail.rank_taste
    json.rank_env @store.store_detail.rank_env
    json.rank_service @store.store_detail.rank_service
    json.phones @store.store_detail.phones
    json.wechat_qrcode @store.store_detail.wechat_qrcode
  end
  json.attachment_images @store.attachment_images do |attachment_image|
    json.file_thumb_url attachment_image.file.thumb.url
    json.file_url attachment_image.file.url
  end
end