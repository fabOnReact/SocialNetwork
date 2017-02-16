Rails.application.routes.draw do
  
  get 'hosts/index'
  get 'hosts/new'
  get 'hosts/edit'

  # omniauth facebook
  devise_for :users, :controllers => { 
  	:omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "registrations"
  	#:confirmations => "confirmations"
  } 
=begin
  do
  get '/users/connect/:network', :to => redirect("/users/auth/%{network}"), :as => 'user_oauth_connect'
  end
=end
  # log out
  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # => end  

  get '/main/home' => 'main#welcome'
  get '/users/welcome' => 'user#welcome'
  
  resources :developers

  match 'user_root' => 'user#welcome', as: :user_root, :via => :get
  
  root :to => 'main#welcome'
end
