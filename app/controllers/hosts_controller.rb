class HostsController < ApplicationController
  before_action :authenticate_user!

  def index 
   #controllare che l'host abbia degli ads con delle skill
    locations_skills = [] #ActsAsTaggableOn::Tag::ActiveRecord_Relation
    locations_skills_id = [] 
    current_user.host.locations.each do |location|
      skills = location.ads.tag_counts_on(:skills)    
      skills.each do |skill|
        if locations_skills.find_by_name(skill[:name])
          #locations_skills.find_by_name(skill[:name])[:taggings_count] += skill[:taggings_count]
        else
        end

        locations_skills << skill[:name]
        locations_skills_id << skill[:id]

      end
    end
    @developers = Developer.tagged_with(locations_skills, :any => :true)


    if current_user.host != nil
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
    
    # Change in the ads parameters "1" into 1
    ads_params.each do |index, value|
            if value == "1"
              ads_params[index] = 1 
            end
    end
    
    # Make the queries if those parameters are filled
    if new_params.empty? && ads_params.empty? && skill_params[:ads_attributes][:skill_list].empty?
      redirect_to action: "index"
    elsif new_params.empty? && ads_params.empty?
      binding.pry
      @locations = Location.all 
    elsif ads_params.empty?
      @locations = Location.joins(:ads).where(locations: new_params).includes(:ads)
    elsif new_params.empty?
      @locations = Location.joins(:ads).where(ads: ads_params).includes(:ads)     
    else # All parameter are present
      @locations = Location.joins(:ads).where(locations: new_params, ads: ads_params).includes(:ads)
    end
    # Now if skills parameters are present, filter by skill
    if skill_params[:ads_attributes][:skill_list].present?
      @ads_with_tags = Ad.tagged_with(skill_params[:ads_attributes][:skill_list]) #ads
      locations_id = []
      ads_id = []
      old_location_id = "starting"
      @ads_with_tags.each do |ad|
        ads_id << ad.id
        if ad.location_id != old_location_id
        locations_id << ad.location_id
        end
        old_location_id = ad.location_id
      end
        @locations = @locations.joins(:ads).where(ads: {id: ads_id}).includes(:ads)
    end
    @project = Project.new
    @project.tasks.build
    @project.ads.build      
  end

  def new
  	if current_user.host == nil
  		@host = Host.new
  	else
  		redirect_to action: "edit"
  	end
  end

  def create 
  	@host = Host.new(input_params)
  	if @host.save && current_user.host = @host
  		flash[:notice] = "Profile sucessfully Saved"
  		redirect_to action: "index", id: @host.id
  	else
  		flash[:alert] = "An error has occurred during the saving"
  		render "new"
  	end
  end

  def edit
  	@host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update_attributes(input_params)
    	flash[:notice] = "Profile sucessfully Edited"
    	redirect_to action: "edit"
    else
    	flash[:alert] = "An error has occurred during the saving"
    	render "edit"
    end
  end

  def show
  	@host = Host.find(params[:id])
  end

  private

  def input_params
  	params.require(:host).permit(:description, :location, :singleroom, :sharedroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :interest_list, :skill_list)
  end
end
