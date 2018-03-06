class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include BaseResource
  before_action :authenticate_user!, unless: :devise_controller?
end
