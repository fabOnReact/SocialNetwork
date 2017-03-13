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

	def index_update
		@location = Location.new
		@location.ads.build
		new_params = param_clean(location_params).to_h
		ads_params = new_params.delete(:ads_attributes).to_h
		#binding.pry
		@locations = Location.joins(:ads).where(locations: new_params, ads: ads_params).includes(:ads)
		binding.pry
		#@locations = Location.joins(:ads).where(locations: {location_attributes}, ads: {remote: location_attributes['remote']})

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

	def location_params
		params.require(:location).permit(:country, :location, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :singleroom, {:ads_attributes => [:remote, :days]})
		binding.pry
	end

	def ads_params
		params.require(:location).permit()
	end

	def param_clean(_params)
	#	binding.pry
	  _params.delete_if do |k, v|
	    if v.instance_of?(ActionController::Parameters)
	      param_clean(v)
	    end
	    v.empty? || v == "0" || v == 0
	  end
	end	

	def ad_params
		params.require(:location).permit(:ads [:remote, :days])
	end	
end























=begin		
		location_attributes = location_params.select { |_, v| 
		if v.class != ActionController::Parameters
			v.present? if  v != 0 
		else
			binding.pry 
			v[:remote].present? if v[:remote] != 0
			v[:days].present? if v[:days] !=0
		end
		} 
=end		
		#@locations = Location.joins(:ads).where(locations: {location_attributes}, ads: {remote: location_attributes['remote']})
		#location_attributes[:ads_attributes]["0"][:remote]

#params.require(:ad).permit(:skill_list, :remote, :days)
#other params params.require(:ad).permit(:skill_list)


=begin		
		@locations = Location.where(new_params)
		@ads = Ad.where(ads_params)
		@ads = @ads.where(location_id: @locations.id)
		@ads.each do |ad|	

		@ads = []
		@locations.each do |location|
		   location.ads.each do |ad|
		   	 #binding.pry
		     if 
		       @ads << ad 
		     end  
		   end  
		end  
=end		
		#puts @ads
		#@locations = @locations.joins(:ads).where(ads: ads_params)
		#@locations = Location.joins(:ads).where(locations: new_params, ads: ads_params)
		#@locations = Location.joins(:ads).where(locations: {location_params}, ads: {location_attributes['remote']})
		#@locations = Location.joins(:ads).where(new_params)
		#@locations = Location.joins(:ads).where(locations: new_params, ads: new_params[:ads_attributes])
		#binding.pry



# ads_params = @ads_params.require(:ads).permit(:id).to_h
# location_params = @location_params.require(:location).permit(:id).to_h
