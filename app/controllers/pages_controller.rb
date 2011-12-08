class PagesController < ApplicationController
  def home
    @title = "Home"
    # Fetch all of the projects to display on the home page, using pagination.
    @projects = Project.all
  end
  
  def about
    @title = "About"
  end

end
