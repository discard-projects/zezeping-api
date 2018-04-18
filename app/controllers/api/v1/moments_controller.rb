class Api::V1::MomentsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    super Moment.where(enabled: true)
  end

  def create
    params['store_id'] = current_user.try(:store).try(:id)
    params['enabled'] = true
    super
  end

  def show
    super do |moment|
      View.try_add_viewable moment
    end
  end

  def toggle_approve
    br_show do |moment|
      vote = moment.votes.find_or_initialize_by(user: current_user)
      is_persisted = vote.persisted?
      is_persisted ? vote.destroy : vote.save
      render json: {is_approved: !is_persisted, votes_count: moment.reload.votes_count}, status: 200
    end
  end
end
