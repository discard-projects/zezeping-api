class Api::V1::CategoriesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:show, :stores]
  def stores
    stores =  Category.find_by(id: params[:id]).subtree_stores
    case params[:sort_type]
      when 'popularity'
        stores = stores.order(rank: :desc, comments_count: :desc, updated_at: :desc)
      when 'distance'
        stores = stores.near([loc['lat'], loc['lng']], 100).order(comments_count: :desc, updated_at: :desc)
      else # intelligent（智能）
        stores = stores.order(suggested_at: :desc, comments_count: :desc, updated_at: :desc)
    end
    br_index stores
    render 'api/v1/stores/index'
  end

  private

  def loc
    JSON.parse params[:loc]
  end
end
