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

class Project < ActiveRecord::Base
  # Attributes that can be modified in the database.
  attr_accessible(:title, :author, :author_email, :contents)
  
  # Regular expression for checking the entered email format.
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # Validation
  validates(:title, :presence => true, :length => {:maximum => 100}, :uniqueness => true)
  validates(:author, :presence => true, :length => {:maximum => 50})
  validates(:author_email, :presence => true, :length => {:maximum => 50},
   :format => {:with => email_regex})
  validates(:contents, :presence => true)
  
  
end
