class ApplicationController < ActionController::Base
	layout "user"

  	protect_from_forgery with: :exception
end
