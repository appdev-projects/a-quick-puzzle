Rails.application.routes.draw do

  get("/a-quick-puzzle", { :controller => "pages", :action => "puzzle" })
  get("/",               { :controller => "pages", :action => "puzzle" })

  # ======== Add your routes above this =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
