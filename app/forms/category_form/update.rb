module CategoryForm
  class Update < Reform::Form
    model :category

    property :name

    validates :name, presence: true, length: { maximum: 40 }
  end
end