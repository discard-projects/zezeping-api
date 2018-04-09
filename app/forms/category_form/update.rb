module CategoryForm
  class Update < Reform::Form
    model :category

    property :name
    property :parent_id
    property :logo
    property :category

    validates :name, presence: true, length: { maximum: 40 }
    validates :category, presence: true
  end
end