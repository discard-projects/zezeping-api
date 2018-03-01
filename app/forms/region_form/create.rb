module RegionForm
  class Create < Reform::Form
    model :region

    property :name

    validates :name, presence: true, length: { maximum: 40 }
  end
end