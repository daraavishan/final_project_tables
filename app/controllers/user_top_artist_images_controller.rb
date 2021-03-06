class UserTopArtistImagesController < ApplicationController
  before_action :current_user_must_be_user_top_artist_image_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_user_top_artist_image_user
    user_top_artist_image = UserTopArtistImage.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == user_top_artist_image.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = UserTopArtistImage.ransack(params[:q])
    @user_top_artist_images = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("user_top_artist_image_templates/index.html.erb")
  end

  def show
    @user_top_artist_image = UserTopArtistImage.find(params.fetch("id_to_display"))

    render("user_top_artist_image_templates/show.html.erb")
  end

  def new_form
    @user_top_artist_image = UserTopArtistImage.new

    render("user_top_artist_image_templates/new_form.html.erb")
  end

  def create_row
    @user_top_artist_image = UserTopArtistImage.new

    @user_top_artist_image.user_id = params.fetch("user_id")
    @user_top_artist_image.image_url = params.fetch("image_url")

    if @user_top_artist_image.valid?
      @user_top_artist_image.save

      redirect_back(:fallback_location => "/user_top_artist_images", :notice => "User top artist image created successfully.")
    else
      render("user_top_artist_image_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @user_top_artist_image = UserTopArtistImage.find(params.fetch("prefill_with_id"))

    render("user_top_artist_image_templates/edit_form.html.erb")
  end

  def update_row
    @user_top_artist_image = UserTopArtistImage.find(params.fetch("id_to_modify"))

    
    @user_top_artist_image.image_url = params.fetch("image_url")

    if @user_top_artist_image.valid?
      @user_top_artist_image.save

      redirect_to("/user_top_artist_images/#{@user_top_artist_image.id}", :notice => "User top artist image updated successfully.")
    else
      render("user_top_artist_image_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @user_top_artist_image = UserTopArtistImage.find(params.fetch("id_to_remove"))

    @user_top_artist_image.destroy

    redirect_to("/users/#{@user_top_artist_image.user_id}", notice: "UserTopArtistImage deleted successfully.")
  end

  def destroy_row
    @user_top_artist_image = UserTopArtistImage.find(params.fetch("id_to_remove"))

    @user_top_artist_image.destroy

    redirect_to("/user_top_artist_images", :notice => "User top artist image deleted successfully.")
  end
end
