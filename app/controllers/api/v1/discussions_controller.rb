class Api::V1::DiscussionsController < Api::V1::BaseController
  before_action :set_discussable, only: [:create]

  def create
    params['user_id'] = current_user.id
    params['discussable'] = @discussable
    params['enabled'] = true
    super
  end

  private

  def set_discussable
    # model_name 在routes.rb 中指定
    parent_class = params[:model_name].constantize
    parent_foreing_key = params[:model_name].foreign_key
    @discussable = parent_class.find(params[parent_foreing_key])
  end
end
