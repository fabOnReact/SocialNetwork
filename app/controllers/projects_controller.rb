class ProjectsController < ApplicationController
  def index
  	@projects = current_user.host.projects
  end

  def new
  	@project = Project.new
  end

  def create 
  	@project = Project.new(input_params)
  	if @project && current_user.host.projects << @project
		flash[:notice] = "Project sucessfully Saved"
		redirect_to action: "index"
	else
		flash[:alert] = "An error has occurred during the saving"
		render "new"
	end
  end

  def edit
  end

  def show
  end
end
