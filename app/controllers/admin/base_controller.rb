class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!, unless: :devise_controller?
end
