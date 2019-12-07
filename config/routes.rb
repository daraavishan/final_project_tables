Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "user_top_artist_images#index"
  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the User top artist image resource:

  # CREATE
  get("/user_top_artist_images/new", { :controller => "user_top_artist_images", :action => "new_form" })
  post("/create_user_top_artist_image", { :controller => "user_top_artist_images", :action => "create_row" })

  # READ
  get("/user_top_artist_images", { :controller => "user_top_artist_images", :action => "index" })
  get("/user_top_artist_images/:id_to_display", { :controller => "user_top_artist_images", :action => "show" })

  # UPDATE
  get("/user_top_artist_images/:prefill_with_id/edit", { :controller => "user_top_artist_images", :action => "edit_form" })
  post("/update_user_top_artist_image/:id_to_modify", { :controller => "user_top_artist_images", :action => "update_row" })

  # DELETE
  get("/delete_user_top_artist_image/:id_to_remove", { :controller => "user_top_artist_images", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
