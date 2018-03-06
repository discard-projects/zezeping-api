class Api::V1::HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @food_stores = Category.find_by(name: 'Food').stores.limit(12)
  end
end
