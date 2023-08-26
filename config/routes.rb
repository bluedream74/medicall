Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root "pages#home"

  get "/privacy-policy", to: "pages#privacy_policy"

  resource :dashboard, only: [:show] do
    get "account", on: :member
  end

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

  scope "/dashboard" do
    resources :clinics do
      resources :clinic_programs, only: [:new, :create, :edit, :update, :destroy]
      resources :call_logs
      get :step1, controller: "wizards"
      post :step1, controller: "wizards", action: "step1_create"
      get :step2, controller: "wizards"
      post :step2, controller: "wizards", action: "step2_create"
      get :complete, controller: "wizards"
    end
  end

  namespace :twilio do
    post :welcome, controller: "welcome", action: :create
    resources :ivr_responds, only: :create
  end

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout", edit: "account-edit" },
                     # controllers: { registrations: 'custom_registrations' }
                     controllers: { registrations: "users/registrations", confirmations: "users/confirmations" }
end
