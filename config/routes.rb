Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root "pages#home"

  get "sample", to: "pages#sample"

  # resource :dashboard, only: [:show] do
  #   get "account", on: :member
  # end

  resources :clinic_wizard, only: [], path: "clinic_wizard" do
    collection do
      post :create, path: "/", as: "create"
    end
    member do
      post :edit_info, path: "/edit_info", as: "edit_info"
      patch :update_info, path: "/update_info", as: "update_info"
      get :step2, path: "/step1", as: "step1"
      get :step2, path: "/step2", as: "step2"
      get :complete, path: "/complete", as: "complete"
    end
  end

  # scope "/dashboard" do
  #   resources :clinics do
  #     resources :clinic_programs, only: [:new, :create, :edit, :update, :destroy]
  #     member do
  #       get "edit_schedule", to: "clinics#edit_schedule", as: "edit_schedule"
  #       patch "update_schedule", to: "clinics#update_schedule", as: "update_schedule"
  #       get "add_customer"
  #       post "create_customer"
  #       get "customer_index"
  #       get "edit_customer/:customer_id", to: "clinics#edit_customer", as: "edit_customer"
  #       patch "update_customer/:customer_id", to: "clinics#update_customer", as: "update_customer"
  #       delete "destroy_customer/:customer_id", to: "clinics#destroy_customer", as: "destroy_customer"
  #     end
  #   end
  # end

  namespace :dashboard do
    root to: "welcome#show"
    resources :clinics
    namespace :clinic, path: "/clinics/:clinic_id" do
      resources :customers
    end
  end

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout", edit: "account-edit" },
                     # controllers: { registrations: 'custom_registrations' }
                     controllers: { registrations: "users/registrations", confirmations: "users/confirmations" }
end
