# Use Factory to imitate the project object for testing
Factory.define :project do |project|
  project.title                  "Very cool"
  project.author                 "roman"
  project.author_email              "roman@email.com"
  project.contents "Description of a very cool project"
end