module BannerForm
  class Update < Reform::Form
    model :banner

    property :name
    property :image
    property :desc
    property :link
    property :enabled

    validates :name, :link, presence: true
  end
end