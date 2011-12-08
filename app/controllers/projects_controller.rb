class ProjectsController < ApplicationController
  
  # Looks up the project currently selected.
  def show
    @project = Project.find(params[:id])
  end
  
  # Creates a new project.
  def new
    @title = "New Project"
  end

end
