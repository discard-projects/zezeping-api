module ShopForm
  class Create < Reform::Form
    model :shop

    property :name
    property :category_id

    validates :name, presence: true, length: { maximum: 40 }
  end
end