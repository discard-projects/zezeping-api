module ProductForm
  class Create < Reform::Form
    model :product

    property :store_id
    property :product_category_id
    property :name
    property :price
    property :image

    validates :name, presence: true, length: { maximum: 40 }
    validates :store_id, :product_category_id, presence: true
  end
end