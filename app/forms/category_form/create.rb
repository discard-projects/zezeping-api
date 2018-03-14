module CategoryForm
  class Create < Reform::Form
    model :category

    property :name
    property :parent_id
    property :enabled
    property :recommended

    validates :name, presence: true, length: { maximum: 40 }
  end
end