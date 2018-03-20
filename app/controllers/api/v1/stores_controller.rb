class Api::V1::StoresController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    super do |stores|
      stores.order(suggested_at: :desc)
    end
  end
end
