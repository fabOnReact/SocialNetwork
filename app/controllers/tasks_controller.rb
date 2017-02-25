class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create 
    @task = Task.new(input_params)
    @project = Project.find(@task.project_id)
    if @task.save && @project.tasks << @task
      flash[:notice] = "Task sucessfully Saved"
      redirect_to controller: "hosts", action: "index"
    else
      flash[:alert] = "An error has occurred during the saving"
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(input_params) #&& current_user.host.tasks.find(@task.id).update
      flash[:notice] = "Task sucessfully Updated"
      redirect_to controller: "hosts", action: "index"
    else
      flash[:alert] = "An error has occurred during the saving"
      render "edit"
    end      
  end

  def show
    @task = Task.find(params[:id])
    @ad = @task.ad
  end

  def delete 
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task sucessfully Deleted"
      redirect_to controller: "hosts", action: "index"
    else
      flash[:alert] = "An error has occurred during the Deletion"
      render "delete"
    end            
  end

  private
  def input_params
    params.require(:task).permit(:name, :project_id, :description, :completed, :skill_list, :days)
  end

end