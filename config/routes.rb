Rails.application.routes.draw do
  
  #get '/welcome' => 'main#welcome'
  get '/welcome' => 'user#email_confirmation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :account, controllers: { 
  	sessions: "account/sessions",
  	passwords: "account/passwords",
  	registrations: "account/registrations"
  	}								 
  match '/:controller(/:action(/:id))', :via => [:get, :post]
  root 'main#welcome'
end
