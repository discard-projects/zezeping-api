class User < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at, :tokens])

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_one :store
  has_many :posts

  def sec_email
    email.gsub(/(\A.{2})(.*)(@.*\z)/){"#{$1}***#{$3}"}
  end

  def id_hash
    Digest::SHA1.hexdigest("#{self.id}")
  end
end
