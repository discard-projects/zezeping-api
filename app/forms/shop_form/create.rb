module ShopForm
  class Create < Reform::Form
    model :shop

    property :name
    property :desc
    property :category_id
    property :region_id
    property :logo
    property :attachment_image_ids

    validates :name, presence: true, length: { maximum: 40 }
  end
end