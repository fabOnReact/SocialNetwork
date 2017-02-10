class UserController < ApplicationController
	before_action :authenticate_user!
	def welcome
		#@user = User.find(9)
		#@user.roles_id = 4
	end
end
