module ShopDetailForm
  class Update < Reform::Form
    model :shop_detail

    property :phones
  end
end