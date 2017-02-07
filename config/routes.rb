Rails.application.routes.draw do
  
  #devise_for :users
  # omniauth facebook
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # log out
  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # => end  
  get '/main/home' => 'main#welcome'
  get '/user/welcome' => 'user#welcome'
  match 'user_root' => 'user#welcome', as: :user_root, :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #match '/:controller(/:action(/:id))', welcome:via => [:get, :post]
  #resources :account
  root :to => 'main#welcome'
end
