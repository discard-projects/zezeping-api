class Api::V1::AttachmentImagesController < ApplicationController
  def create
    super do |hash, form|
      form.save
      render json: {
          msg: 'successfully_create',
          item: form.model.as_json(only: [:id, :file])
      }, status: 200 and return
    end
  end
end