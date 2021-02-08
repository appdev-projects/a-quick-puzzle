Rails.application.routes.draw do

  get("/", { :controller => "pages", :action => "puzzle" })
  post("/record_guess", { :controller => "pages", :action => "write_cookie" })

end
