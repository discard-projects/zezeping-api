Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :json do
    mount_devise_token_auth_for 'User', at: 'auth'
    # api
    constraints subdomain: /\Aapi/ do
      scope module: 'api' do
        namespace :v1 do
          resource :profile
        end
      end
    end
  end
end
