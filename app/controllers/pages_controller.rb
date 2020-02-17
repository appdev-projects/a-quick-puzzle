class PagesController < ApplicationController
  def puzzle
    render({ :template => "pages/puzzle.html.erb" })
  end
  
  def write_cookie

    redirect_to("/")
  end
end
