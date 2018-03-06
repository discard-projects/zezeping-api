class Api::V1::HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @categories = Category.where(recommended: true)
  end

  def stores
    params[:per_page] = 12
    @stores = br_index(Category.find_by(name: params[:category_name]).stores)
  end
end
