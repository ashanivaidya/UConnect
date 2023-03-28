
class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end

  def create
    Rating.create(:rating => params[:rating][:rating], :user_id => params[:user][:'User ID'], :student_application_id => params[:app][:'Application ID'])
    redirect_to ratings_index_path
  end

  def create_from_application
    user = User.where("email = '#{current_user.email}'").first
    Rating.create(:rating => params[:rating][:rating], :user_id => user.id, :student_application_id => params[:application_id], :comment => params[:comment][:comment])
    redirect_to student_application_path(StudentApplication.find(params[:application_id]))
  end

  def show_application_ratings
    app_id = params[:app_id]
    @ratings = Rating.where("student_application_id = '#{app_id}'")
  end

  def show_user_ratings
    user_id = params[:user_id]
    @ratings = Rating.where("user_id = '#{user_id}'")
  end
end

