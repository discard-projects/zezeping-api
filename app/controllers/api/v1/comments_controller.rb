class Api::V1::CommentsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    super @store.comments
  end
end
