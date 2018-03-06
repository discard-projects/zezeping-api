class Api::V1::HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @food_stores = Store.limit(12)
  end
end
