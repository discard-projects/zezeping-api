class Api::V1::CategoriesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:show, :stores]
  def stores
    @stores = br_index Category.find_by(id: params[:id]).stores.order(comments_count: :desc, updated_at: :desc)
    render 'api/v1/stores/index'
  end
end
