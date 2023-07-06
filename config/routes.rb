Rails.application.routes.draw do
  root 'pages#home'

  get 'sample', to: 'pages#sample'

  resource :dashboard, only: [:show]

  # devise_for :users, skip: :all
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new', as: :new_user_session
  #   post 'login', to: 'devise/sessions#create', as: :user_session
  #   delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  #   get 'register', to: 'devise/registrations#new', as: :new_user_registration
  #   post 'register', to: 'devise/registrations#create', as: :user_registration
  #   get 'profile', to: 'devise/registrations#edit', as: :edit_user_registration
  #   put 'profile', to: 'devise/registrations#update'
  #   patch 'profile', to: 'devise/registrations#update'
  #   delete 'profile', to: 'devise/registrations#destroy'
  # end

  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}

end
