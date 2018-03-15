module StoreForm
  class Create < Reform::Form
    model :store

    property :name
    property :desc
    property :open_time_desc
    property :category_ids
    property :region_id
    property :address
    property :logo
    property :attachment_image_ids

    property :lat
    property :lng

    # collection :attachment_images, populate_if_empty: AttachmentImage, form: AttachmentImageForm::Create
    property :store_detail, populate_if_empty: StoreDetail, form: StoreDetailForm::Create

    validates :name, presence: true, length: { maximum: 40 }
  end
end