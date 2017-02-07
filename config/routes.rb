Rails.application.routes.draw do
  
  devise_for :users
  get '/main/home' => 'main#welcome'
  get '/user/welcome' => 'user#welcome'
  match 'user_root' => 'user#welcome', as: :user_root, :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	  
  #match '/:controller(/:action(/:id))', welcome:via => [:get, :post]
  #resources :account
  root :to => 'main#welcome'
end
