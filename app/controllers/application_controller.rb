class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include BaseResource

  def toggle_switch
    field = params[:field].to_sym
    br_show do |model|
      if [true, false].include? model[field]
        model.toggle!(field)
        render json: {value: model[field], msg: 'successfully'}, status: 200 and return
      else
        render json: {msg: 'is not boolean'}, status: 422 and return
      end
    end
  end
end
