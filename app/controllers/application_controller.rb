class ApplicationController < ActionController::Base
	layout "user"
	before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!
  	#protect_from_forgery with: :exception
  	protect_from_forgery prepend: false

  	protected 

  	def after_sign_in_path_for(resource)
      edit_user_registration_path
	  end

    def after_sign_out_path_for(resource)
      root_path
    end

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :country, :location, :roles_id, :email, :email_confirmation, :password_confirmation, :avatar]) #:password, 
  		devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :country, :location, :roles_id, :email, :email_confirmation, :password_confirmation, :avatar]) #:password, 
	end  		
end
