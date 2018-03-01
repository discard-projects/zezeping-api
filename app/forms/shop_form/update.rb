module ShopForm
  class Update < Reform::Form
    model :shop

    property :name

    validates :name, presence: true, length: { maximum: 40 }
  end
end