module CommentForm
  class Create < Reform::Form
    model :comment

    property :store_id
    property :user_id
    property :rank
    property :content

    validates :store_id, presence: true
    validates :rank, presence: true, numericality: { greater_than: 0 }
    validates :content, presence: true, length: { maximum: 255 }
  end
end