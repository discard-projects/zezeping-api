class Api::V1::MomentsController < ApplicationController
  def index
    super Moment.where(enabled: true)
  end
end
