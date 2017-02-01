class AdminController < ApplicationController
	#layout 'admin'

	def welcome
	end

	def login
	end

	def signup
		@user = User.new
	end

	def create
		binding.pry
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "User #{@user.firstname} created successfully"
			redirect_to action: 'email_confirmation'
		else
			flash[:alert] = "User #{@user.firstname} was not created successfully"
			render 'signup'
		end
	end

	def email_confirmation
	end

	private
	def user_params
		params.require(:user).permit(:firstname, :lastname, :country, :location, :role, :email, :email_confirmation, :password, :password_confirmation)
	end

end
