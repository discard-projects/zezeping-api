class Api::V1::HomeController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :stores]
  def index
    @categories = Category.where(recommended: true)
  end

  def stores
    params[:per_page] = 12
    @stores = br_index(Category.find_by(name: params[:category_name]).stores.order(comments_count: :desc, updated_at: :desc))
  end
end
