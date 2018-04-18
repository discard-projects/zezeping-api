class Api::V1::SubjectsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  def create
    params['user_id'] = current_user.id
    params['enabled'] = true
    super
  end

  def show
    super do |subject|
      View.try_add_viewable subject
    end
  end

  def toggle_approve
    br_show do |subject|
      vote = subject.votes.find_or_initialize_by(user: current_user)
      is_persisted = vote.persisted?
      is_persisted ? vote.destroy : vote.save
      render json: {is_approved: !is_persisted, votes_count: subject.reload.votes_count}, status: 200
    end
  end
end
