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

    # apa
    constraints subdomain: /\Aapa/ do
      scope module: 'admin' do
        resources :shops
        resources :regions do
          get :index_roots, on: :collection
        end
        resources :categories do
          get :index_roots, on: :collection
        end
      end
    end
  end
end
