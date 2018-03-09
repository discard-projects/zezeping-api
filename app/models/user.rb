class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User

  before_update :check_nickname

  def sec_email
    email.gsub(/(\A.{2})(.*)(@.*\z)/){"#{$1}***#{$3}"}
  end

  private

  # 授权登录操作 不更新nickname # sign_in_count 和 nickname 同时存在认为 是 oath认证登录操作
  def check_nickname
    self.restore_nickname! if changes['nickname'].present? && changes['sign_in_count'].present?
  end
end
