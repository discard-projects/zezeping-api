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
end
