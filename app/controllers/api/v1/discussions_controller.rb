class Api::V1::DiscussionsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_discussable, only: [:index, :create, :toggle_approve]

  def index
    super @discussable.discussions do |discussions|
      discussions.order(:id)
    end
  end

  def create
    params['user_id'] = current_user.id
    params['discussable'] = @discussable
    super
  end

  def toggle_approve
    discussion = @discussable.discussions.find(params[:id])
    vote = discussion.votes.find_or_initialize_by(user: current_user, voteable: discussion)
    is_persisted = vote.persisted?
    is_persisted ? vote.destroy : vote.save
    render json: {is_approved: !is_persisted, votes_count: discussion.reload.votes_count}, status: 200
  end

  private

  def set_discussable
    # model_name 在routes.rb 中指定
    parent_class = params[:model_name].constantize
    parent_foreing_key = params[:model_name].foreign_key
    @discussable = parent_class.find(params[parent_foreing_key])
  end
end
