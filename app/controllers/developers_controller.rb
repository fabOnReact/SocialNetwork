class DevelopersController < ApplicationController

	def index
	end


	def new
		if current_user.developer == nil 			
			@developer = Developer.new
		else 
			redirect_to action: "edit"
		end
	end

	def create
		@developer = Developer.new(input_params)
		if @developer.save
			current_user.developer = @developer
			redirect_to action: "index"
		else
			render "new"
		end
	end

	def edit
		@developer = Developer.find(params[:id])
	end

	def update
		@developer = Developer.find(params[:id])
		if @developer.update_attributes(input_params) 
			redirect_to action: "index"
		else
			render "new"
		end			
	end 

	private

	def input_params
		params.require(:developer).permit(:experience, :interests, :jobtitle, :website_url, :tag_list, :skill_list, :interest_list)
	end

end
