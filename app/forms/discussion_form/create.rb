module DiscussionForm
  class Create < Reform::Form
    model :discussion

    property :discussable
    property :user_id
    property :content
    property :enabled

    validates :discussable, presence: true
    validates :content, presence: true, length: { maximum: 255 }
  end
end