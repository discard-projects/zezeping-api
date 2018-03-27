class Api::V1::StoresController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show, :detail]

  def index
    super do |stores|
      stores.order(suggested_at: :desc)
    end
  end

  def show
    super do |store|
      store.try_add_view
    end
  end

  def detail
    show
  end
end
