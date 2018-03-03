module AttachmentImageForm
  class Create < Reform::Form
    model :attachment_image

    property :file

    validates :file, presence: true
  end
end