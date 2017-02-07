class AccountController < ApplicationController
	#before_action :authenticate_account!	
	protect_from_forgery with: :exception
	def index
	end
end
