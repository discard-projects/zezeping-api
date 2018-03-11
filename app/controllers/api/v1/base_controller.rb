class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  around_action :set_thread_footprint_actor

  private

  def set_thread_footprint_actor
    Footprintable::Current.actor = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Footprintable::Current.actor = nil
  end
end
