module ApplicationHelper
  
  def title
    base_title = "CS50 Projects"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
