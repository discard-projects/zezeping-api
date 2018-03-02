module RegionForm
  class Update < Reform::Form
    model :region

    property :name
    property :parent_id

    validates :name, presence: true, length: { maximum: 40 }
  end
end