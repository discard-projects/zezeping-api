module StoreDetailForm
  class Update < Reform::Form
    model :shop_detail

    property :phones
    property :wechat_qrcode
  end
end