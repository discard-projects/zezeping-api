class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_one :store

  def sec_email
    email.gsub(/(\A.{2})(.*)(@.*\z)/){"#{$1}***#{$3}"}
  end
end
