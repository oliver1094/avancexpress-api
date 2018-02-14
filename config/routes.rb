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
          post 'register_personal' => 'clients#register_personal'
          post 'register_laboral' => 'clients#register_laboral'
          post 'upload_contract_files' => 'clients#upload_contract_files'
          post 'upload_files' => 'clients#upload_files'
          get 'get_client_files' => 'clients#get_client_files'
          get 'get_contract_files' => 'clients#get_contract_files'
          get 'get_all_files' => 'clients#get_all_files'
          get 'get_clients' => 'clients#get_clients'
          get 'aply_cupon' => 'clients#aply_cupon'
          get 'get_client_by_hour' => 'clients#get_client_by_hour'
          post 'change_status_loan' => 'clients#change_status_loan'
          post 'validation_second' => 'clients#validation_second'
          post 'validation_third' => 'clients#validation_third'
          post 'validation_four' => 'clients#validation_four'
          get 'create_pdff' => 'clients#create_pdff'
        end
      end
    end
  end

end
