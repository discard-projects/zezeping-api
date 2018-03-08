module CategoryForm
  class Update < Reform::Form
    model :category

    property :name
    property :parent_id

    validates :name, presence: true, length: { maximum: 40 }
  end
end