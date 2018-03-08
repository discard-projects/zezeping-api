module Api::ProfileForm
  class Update < Reform::Form
    model :user

    property :nickname

    validates :nickname, presence: true, length: { maximum: 40 }
  end
end