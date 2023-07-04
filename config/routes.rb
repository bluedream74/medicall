Rails.application.routes.draw do
  get 'pages/home'

  # root "articles#index"
  devise_for :users, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}

end
