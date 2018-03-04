class Api::V1::HomeController < ApplicationController
  def index
    @food_stores = Store.limit(12)
  end
end
