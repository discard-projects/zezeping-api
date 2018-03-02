module ShopForm
  class Update < Reform::Form
    model :shop

    property :name
    property :desc
    property :category_id
    property :region_id

    validates :name, presence: true, length: { maximum: 40 }
  end
end