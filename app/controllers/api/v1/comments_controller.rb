class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_commentable, only: [:create]
  def index
    @store = Store.find(params[:store_id])
    super @store.comments
  end

  def create
    params['user_id'] = current_user.id
    params['commentable'] = @commentable
    super
  end

  private

  def set_commentable
    # model_name 在routes.rb 中指定
    parent_class = params[:model_name].constantize
    parent_foreing_key = params[:model_name].foreign_key
    @commentable = parent_class.find(params[parent_foreing_key])
  end
end
