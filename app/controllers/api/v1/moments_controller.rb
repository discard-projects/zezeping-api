class Api::V1::MomentsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]
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
end
