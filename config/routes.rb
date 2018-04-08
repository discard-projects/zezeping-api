Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :json do
    mount_devise_token_auth_for 'User', at: 'auth' , controllers: {
      omniauth_callbacks: 'authentication_rails/omniauth_callbacks'
    }
    mount_devise_token_auth_for 'Admin', at: 'auth_admin'
    # api
    constraints subdomain: /\Aapi/ do
      scope module: 'api' do
        namespace :v1 do
          resources :home, only: [:index] do
            get :stores, on: :collection
          end
          resource :profile, only: [:show, :update]
          resources :stores, only: [:index, :show], model_name: 'Store' do
            resources :comments, only: [:index, :create]
            get :detail, on: :member
          end
          resources :attachment_images, only: [:create]
          resources :categories, only: [:show] do
            get :stores, on: :member
          end
          resources :moments, only: [:index, :create]
          resources :subjects, only: [:index, :create], model_name: 'Subject' do
            resources :discussions, only: [:create] do
              put :toggle_approve, on: :member
            end
          end
          resources :posts, only: [:index, :show, :create, :update], model_name: 'Post' do
            resources :discussions, only: [:create] do
              put :toggle_approve, on: :member
            end
            put :toggle_approve, :toggle_collect, on: :member
          end
        end
      end
    end

    # apa
    constraints subdomain: /\Aapa/ do
      scope module: 'admin' do
        resources :users
        resource :profile
        resources :stores, model_name: 'Store' do
          resources :comments
          resources :product_categories
          resources :products
          put :toggle_switch, on: :member
          get :detail, on: :member
        end
        resources :regions do
          get :index_roots, on: :collection
        end
        resources :categories do
          get :index_roots, on: :collection
          put :toggle_switch, :increment_position, :decrement_position, on: :member
        end
        resources :attachment_images
        resources :banners do
          put :toggle_switch, on: :member
        end
        resources :moments do
          put :toggle_switch, on: :member
        end
      end
    end
  end
end
