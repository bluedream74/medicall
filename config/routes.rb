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
      end
    end
  end
  
  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout', :edit => 'account-edit'},
  controllers: { registrations: 'custom_registrations' }

end
