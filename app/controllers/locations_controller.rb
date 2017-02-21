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
  		redirect_to controller: "hosts", action: "index"
  	else
  		flash[:alert] = "An error has occurred during the saving"
  		render "new"
  	end  		
  end

  def edit
  	@location = Location.find(params[:id])
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  def input_params
  	params.require(:location).permit(:description, :location, :singleroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :country, :state)
  end
end
