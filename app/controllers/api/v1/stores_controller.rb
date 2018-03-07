class Api::V1::StoresController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:show]
end
