# == Schema Information
#
# Table name: projects
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  author       :string(255)
#  author_email :string(255)
#  contents     :text
#  created_at   :datetime
#  updated_at   :datetime
#


require 'spec_helper'

describe Project do
  
  before(:each) do
    @attr = {:title => "Some Project", :author => "Some Author", 
      :author_email => "author@email.com", :contents => "contents"}
  end
  
  it "should create a new instance with attributes provided" do
    Project.create!(@attr)
  end
  
  #Presence tests    
  it "should require a title" do
  no_title_project = Project.new(@attr.merge(:title => ""))
  no_title_project.should_not be_valid
  end
  
  it "should require an author" do
  no_author_project = Project.new(@attr.merge(:author => ""))
  no_author_project.should_not be_valid
  end
  
  it "should require an author email" do
  no_author_email_project = Project.new(@attr.merge(:author_email => ""))
  no_author_email_project.should_not be_valid
  end
  
  it "should require contents" do
  no_contents_project = Project.new(@attr.merge(:contents => ""))
  no_contents_project.should_not be_valid
  end
  
  #Length tests
  it "should not accept titles that are too long" do
    long_title = "x" * 101
    long_title_project = Project.new(@attr.merge(:title => long_title))
    long_title_project.should_not be_valid
  end
  
  it "should not accept author names that are too long" do
    long_author = "x" * 51
    long_author_project = Project.new(@attr.merge(:author => long_author))
    long_author_project.should_not be_valid
  end
  
  it "should not accept author emails that are too long" do
    long_email = "x" * 51
    long_email_project = Project.new(@attr.merge(:author_email => long_email))
    long_email_project.should_not be_valid
  end
  
    #Format tests (adapted from Ruby on Rails Tutorial)
  it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_project = Project.new(@attr.merge(:author_email => address))
        valid_email_project.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_project = Project.new(@attr.merge(:author_email => address))
        invalid_email_project.should_not be_valid
      end
    end
    
    
    
    # Disregard email case  
    it "should reject email addresses identical up to case" do
        upcased_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => upcased_email))
        user_with_duplicate_email = User.new(@attr)
        user_with_duplicate_email.should_not be_valid
      end
      
    #Duplicate titles 
    it "should reject duplicate titles" do

        Project.create!(@attr)
        project_with_duplicate_title = Project.new(@attr)
        project_with_duplicate_title.should_not be_valid
      end


end
