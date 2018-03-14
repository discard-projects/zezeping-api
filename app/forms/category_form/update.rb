module CategoryForm
  class Update < Reform::Form
    model :category

    property :name
    property :parent_id
    property :logo

    validates :name, presence: true, length: { maximum: 40 }
  end
end