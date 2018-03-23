module ProductCategoryForm
  class Update < Reform::Form
    model :product_category

    property :name
    property :store_id
    property :category_id

    validates :name, presence: true, length: { maximum: 255 }
    validates :store_id, :category_id, presence: true
  end
end