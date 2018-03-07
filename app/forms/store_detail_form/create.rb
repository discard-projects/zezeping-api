module StoreDetailForm
  class Create < Reform::Form
    model :store_detail

    property :phones
    property :wechat_qrcode
  end
end