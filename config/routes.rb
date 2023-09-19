Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  # root "pages#home"

  root "pages#landing"

  get "/privacy-policy", to: "pages#privacy_policy"

  namespace :dashboard do
    root to: "welcome#show"
    resources :clinics
    namespace :clinic, path: "/clinics/:clinic_id" do
      resource :account, only: :show
      resources :customers
      resource :ivr_rule, controller: "ivr_rules"
      resources :ivr_rule_items, controller: "ivr_rule_items"
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
