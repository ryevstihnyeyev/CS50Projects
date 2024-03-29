require 'spec_helper'

describe "LayoutLinks" do
  
    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Home")
    end
    
    it "should have an About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end
    
    it "should have a New Project page at '/new'" do
      get '/new'
      response.should have_selector('title', :content => "New Project")
    end
    
  
end
