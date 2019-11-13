class PagesController < ApplicationController
  def puzzle
    render({ :template => "pages/puzzle.html.erb" })
  end
  
end
