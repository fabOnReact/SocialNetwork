class HostsController < ApplicationController
  def index
    @locations = current_user.host.locations
    @projects = current_user.host.projects
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
  		redirect_to action: "edit", id: @host.id
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
  	params.require(:host).permit(:description, :location, :singleroom, :sharedroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort)
  end
end
