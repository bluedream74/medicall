Rails.application.routes.draw do
  root 'pages#home'

  get 'sample', to: 'pages#sample'

  resource :dashboard, only: [:show] do
    get 'account', on: :member
  end

  scope '/dashboard' do
    resources :clinics do
      member do
        get 'add_customer'
        post 'create_customer'
        get 'customer_index'
        get 'edit_customer/:customer_id', to: 'clinics#edit_customer', as: 'edit_customer' # this routes to clinics#edit_customer
        patch 'update_customer/:customer_id', to: 'clinics#update_customer', as: 'update_customer' # this routes to clinics#update_customer
      end
    end
  end
  
  

  
  
  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout', :edit => 'account-edit'},
  controllers: { registrations: 'custom_registrations' }

end
