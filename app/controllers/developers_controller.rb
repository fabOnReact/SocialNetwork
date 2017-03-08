class DevelopersController < ApplicationController
	before_action :authenticate_user!
	def index	
		if current_user.developer.skills != nil
			i = 0
			old_ad = "firstloop"
			@projects = []
			@ads = Ad.tagged_with(current_user.developer.skills, :any => true)
			@ads = @ads.order(location_id: :desc)
			@ads.each do |ad|
				if i > 0 && old_project_id == ad.project_id
					@projects << ad.project_id 
					i+=1
					old_project_id = ad.project_id
				end
			end
		end
		@location = Location.new
		@location.ads.build
		@project = Project.new
		@project.tasks.build
		@project.ads.build
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
		if @developer.save && current_user.developer = @developer
			flash[:notice] = "Profile sucessfully Saved"
			redirect_to action: "edit", id: @developer.id
		else
			flash[:alert] = "An error has occurred during the saving"
			render "new"
		end
	end

	def edit
		@developer = Developer.find(params[:id])
	end

	def update
		@developer = Developer.find(params[:id])
		if @developer.update_attributes(input_params) 
			flash[:notice] = "Profile sucessfully Saved"
			redirect_to action: "show", id: @developer.id
		else
			flash[:alert] = "An error has occurred during the saving"
			render "new"
		end			
	end 


	def show 
		@developer = Developer.find(params[:id])
		@user = User.find(@developer.user_id)		
	end

	private

	def input_params
		params.require(:developer).permit(:experience, :interests, :jobtitle, :website_url, :tag_list, :skill_list, :interest_list)
	end

end
