class Api::V1::StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
end
