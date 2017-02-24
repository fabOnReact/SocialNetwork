class LocationsController < ApplicationController
  def index
  end

  def new
  	@location = Location.new
  end

  def create
  	@location = Location.new(input_params)
  	if @location && current_user.host.locations << @location
  		flash[:notice] = "Location sucessfully Saved"
  		redirect_to controller: "locations", action: "index"
  	else
  		flash[:alert] = "An error has occurred during the saving"
  		render "new"
  	end  		
  end
 def edit
  	@location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
  	if @location.update_attributes(input_params) && current_user.host.locations.find(@location.id).update_attributes(input_params)
      flash[:notice] = "Location sucessfully Updated"
      redirect_to controller: "hosts", action: "index"
    else
      flash[:alert] = "An error has occurred during the update"
      render "new"
    end      
  end

  def show 
  	@location = Location.find(params[:id])
    #@images = @location.houseimages
  end

  def delete
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      flash[:notice] = "Location deleted successfully"
      redirect_to controller: "hosts", action: "index"
    else 
      flash[:alert] = "Location was not deleted, please try again"
      render("delete")
    end
  end

  private
  def input_params
  	params.require(:location).permit(:description, :location, :singleroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :country, :state, {houseimages: []})
  end
end
