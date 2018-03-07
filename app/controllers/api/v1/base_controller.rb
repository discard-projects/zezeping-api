class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
end
