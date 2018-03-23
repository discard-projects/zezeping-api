module ProductForm
  class Update < Reform::Form
    model :product

    property :product_category_id
    property :name
    property :price
    property :image

    validates :name, presence: true, length: { maximum: 40 }
    validates :product_category_id, presence: true
  end
end