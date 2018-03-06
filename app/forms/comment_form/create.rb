module CommentForm
  class Create < Reform::Form
    model :comment

    property :store_id
    property :user_id
    property :content

    validates :store_id, presence: true
    validates :content, presence: true, length: { maximum: 255 }
  end
end