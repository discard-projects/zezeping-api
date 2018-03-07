module StoreForm
  class Update < Reform::Form
    model :store

    property :name
    property :desc
    property :category_id
    property :region_id
    property :logo

    property :attachment_image_ids
    # collection :attachment_images, populate_if_empty: AttachmentImage, form: AttachmentImageForm::Create
    property :store_detail, populate_if_empty: StoreDetailForm, form: StoreDetailForm::Update

    validates :name, presence: true, length: { maximum: 40 }
  end
end