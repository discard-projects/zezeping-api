module StoreDetailForm
  class Update < Reform::Form
    model :store_detail

    property :phones
    property :wechat_qrcode
  end
end