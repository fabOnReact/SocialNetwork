Rails.application.routes.draw do
  #get '/welcome' => 'main#welcome'
  get '/welcome' => 'user#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/:controller(/:action(/:id))', :via => [:get, :post]
  root 'main#welcome'
end
