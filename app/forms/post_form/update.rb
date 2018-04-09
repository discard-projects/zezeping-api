module PostForm
  class Update < Reform::Form
    model :post

    property :title
    property :user_id
    property :content
    property :enabled, default: true
    property :category_id

    validates :category_id, presence: true
    validate :valid_category_id
    def valid_category_id
      category = Category.find_by(id: self.category_id)
      errors.add(:category_id, '无效的分类') and return unless  category && category.category == 'category_post'
    end
  end
end