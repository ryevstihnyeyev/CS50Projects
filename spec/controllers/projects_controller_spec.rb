require 'spec_helper'

describe ProjectsController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @project = Factory(:project)
    end

    it "should be successful" do
      get :show, :id => @project
      response.should be_success
    end

    it "should find and display the right project" do
      get :show, :id => @project
      assigns(:project).should == @project
    end
  end
    
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "New Project")
    end
  end

end
