class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  around_action :encrypt_data, :set_thread_footprint_actor, :set_thread_current_user

  private

  def set_thread_footprint_actor
    Footprintable::Current.actor = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Footprintable::Current.actor = nil
  end

  def set_thread_current_user
    Current.user = current_user
    Current.remote_ip = request.remote_ip
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end

  def encrypt_data
    yield
  ensure
    if response.status < 400 && response.status >= 200
      response.body = ResponseEncryption::encrypt(response.body)
    end
  end
end
