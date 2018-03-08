class Api::V1::ProfilesController < Api::V1::BaseController
  def show
  end

  def update
    super current_user
  end
end
