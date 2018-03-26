class Api::V1::HomeController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :stores]
  def index
    @categories = Category.where(recommended: true).order(position: :asc)
    @banners = Banner.where(enabled: true)
  end

  def stores
    params[:per_page] = 12 if params[:per_page].blank?
    @stores = br_index(Category.find_by(name: params[:category_name]).subtree_stores.order(suggested_at: :desc))
    render 'api/v1/stores/index'
  end
end
