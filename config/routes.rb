Rails.application.routes.draw do
  root 'pages#home'

  get 'sample', to: 'pages#sample'

  resource :dashboard, only: [:show] do
    get 'account', on: :member
  end

  resources :clinic_wizard, only: [], path: 'clinic_wizard' do
    collection do
      post :create, path: '/', as: 'create'
    end
    member do
      get :edit_info, path: '/edit_info', as: 'edit_info'
      patch :update_info, path: '/update_info', as: 'update_info'
    end
  end

  

  scope '/dashboard' do
    resources :clinics do
      member do
        get 'add_customer'
        post 'create_customer'
        get 'customer_index'
        get 'edit_customer/:customer_id', to: 'clinics#edit_customer', as: 'edit_customer'
        patch 'update_customer/:customer_id', to: 'clinics#update_customer', as: 'update_customer'
        delete 'destroy_customer/:customer_id', to: 'clinics#destroy_customer', as: 'destroy_customer'
      end
    end
  end
  
  
  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout', :edit => 'account-edit'},
  # controllers: { registrations: 'custom_registrations' }
  controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }


end
