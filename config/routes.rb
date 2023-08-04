Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root "pages#home"

  get "sample", to: "pages#sample"

  namespace :dashboard do
    root to: "welcome#show"
    resources :clinics
    namespace :clinic, path: "/clinics/:clinic_id" do
      resource :account, only: :show
      resources :customers
      resources :clinic_programs, only: [:new, :create, :edit, :update, :destroy]
      resources :call_logs
      get :step1, controller: "wizards"
      post :step1, controller: "wizards", action: "step1_create"
      get :step2, controller: "wizards"
      post :step2, controller: "wizards", action: "step2_create"
      get :complete, controller: "wizards"
    end
  end

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout", edit: "account-edit" },
                     # controllers: { registrations: 'custom_registrations' }
                     controllers: { registrations: "users/registrations", confirmations: "users/confirmations" }
end
