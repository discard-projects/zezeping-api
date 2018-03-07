class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @store = Store.find(params[:store_id])
    super @store.comments
  end

  def create
    params['user_id'] = current_user.id
    super
  end
end
