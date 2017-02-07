Rails.application.routes.draw do
  
  get '/main/home' => 'main#welcome'
  get '/user/welcome' => 'user#email_confirmation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :account, controllers: { 
  	sessions: "account/sessions",
  	passwords: "account/passwords",
  	registrations: "account/registrations"
  	}		
  resources :account, only: [:index]
  
  devise_scope :account do
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
  end
  #match '/:controller(/:action(/:id))', :via => [:get, :post]
  #resources :account
  root :to => 'main#welcome'
end
