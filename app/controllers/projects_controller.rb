class ProjectsController < ApplicationController
  
  # Looks up the project currently selected.
  def show
    # no need to escape input! 
    @project = Project.find(params[:id])
    @title = "#{@project.title} by #{@project.author}"
  end
  
  # Creates a new project.
  def new
    @project = Project.new
    @title = "New Project"
  end
  
  
  def create
    @project = Project.new(params[:project])
    if @project.save
       flash[:success] = "Your project was added successfully!"
       redirect_to @project
    else
      @title = "New Project"
      render 'new'
    end
  end
  
  # Deletes a project.
  def destroy 
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to "/"
  end

end
