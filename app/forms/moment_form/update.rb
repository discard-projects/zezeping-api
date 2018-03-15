module MomentForm
  class Update < Reform::Form
    model :moment

    property :content
    property :store_id
    property :attachment_image_ids
    property :enabled

    validates :content, presence: true, length: { maximum: 255 }
  end
end