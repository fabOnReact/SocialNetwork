class ApplicationController < ActionController::Base
	layout "user"
	before_action :configure_permitted_parameters, if: :devise_controller?
  	#protect_from_forgery with: :exception
  	protect_from_forgery prepend: true

  	protected 

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :country, :location, :role, :email, :email_confirmation, :password, :password_confirmation])
	end  		
end
