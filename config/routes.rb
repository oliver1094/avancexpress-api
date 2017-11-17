Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'login#new'

  namespace :api, path: '/',
            defaults: { format: :json } do
    namespace :v1 do
      resources :authorization do
        collection do
          post 'login' => 'authorization#login'
          post 'logout' => 'authorization#logout'
        end
      end
      resources :clients do
        collection do
          get 'index' => 'clients#index'
          get 'get_client' => 'clients#get_client'
          post 'preregister' => 'clients#preregister'
          post 'register' => 'clients#register'
          post 'upload_files' => 'clients#upload_files'
          get 'get_client_files' => 'clients#get_client_files'
          get 'get_clients' => 'clients#get_clients'
          post 'change_status_loan' => 'clients#change_status_loan'
        end
      end
    end
  end

end
