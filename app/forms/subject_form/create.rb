module SubjectForm
  class Create < Reform::Form
    model :subject

    property :user_id
    property :content
    property :attachment_image_ids
    property :enabled

    validates :content, presence: true, length: { maximum: 255 }
  end
end