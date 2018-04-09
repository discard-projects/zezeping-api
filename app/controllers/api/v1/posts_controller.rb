class Api::V1::PostsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :auth_owner, only: [:update]
  def create
    params['user_id'] = current_user.id
    super
  end

  def show
    super do |post|
      View.try_add_viewable post
    end
  end

  # 收藏
  def toggle_collect
    br_show do |post|
      collection = post.collections.find_or_initialize_by(user: current_user, collectable: post)
      is_persisted = collection.persisted?
      is_persisted ? collection.destroy : collection.save
      render json: {is_collected: !is_persisted, collections_count: post.reload.collections_count}, status: 200
    end
  end

  def toggle_approve
    br_show do |post|
      vote = post.votes.find_or_initialize_by(user: current_user, voteable: post)
      is_persisted = vote.persisted?
      is_persisted ? vote.destroy : vote.save
      render json: {is_approved: !is_persisted, votes_count: post.reload.votes_count}, status: 200
    end
  end
end
