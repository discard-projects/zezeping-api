module CommentForm
  class Create < Reform::Form
    model :comment

    property :store_id
    property :user_id
    property :rank
    property :content
    # 是否匿名评论
    property :anonymous

    property :attachment_image_ids

    validates :store_id, presence: true
    validates :rank, presence: true, numericality: { greater_than: 0 }
    validates :content, presence: true, length: { maximum: 255 }
  end
end