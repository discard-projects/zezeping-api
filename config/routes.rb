Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :json do
    mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'auth'
  as :admin do
    # Define routes for Admin within this block.
  end
    # api
    constraints subdomain: /\Aapi/ do
      scope module: 'api' do
        namespace :v1 do
          resources :home do
            get :stores, on: :collection
          end
          resource :profile
          resources :stores do
            resources :comments
          end
        end
      end
    end

    # apa
    constraints subdomain: /\Aapa/ do
      scope module: 'admin' do
        resources :stores
        resources :stores
        resources :regions do
          get :index_roots, on: :collection
        end
        resources :categories do
          get :index_roots, on: :collection
        end
        resources :attachment_images
      end
    end
  end
end
