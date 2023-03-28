class PagesController < ApplicationController
  before_action :confirm_admin, except: [:landing, :update_university]

  def confirm_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

  def admin
    @users = User.all
    @users = User.where("status = 'Unconfirmed'")
    @users = User.where("role = 1")
  end

  def landing

    if params[:search_box] == nil || params[:search_box] == ''
      @universities = []
      @show_table=false
    else
      response = StudentsController.search_collegeapi(params[:search_box])
      json = JSON.parse(response)
      @universities = json['results']
      @show_table=true
    end
  end

  def update_university
    # @test = params[:users]
    if !params[:users].nil?
      Faculty.where("email_id = '#{current_user.email}'").first.update_column(:university_name, params[:users].keys.first)
      flash[:notice] = "Added as a faculty member of #{params[:users].keys.first}. Please wait for admin approval."
    else
      flash[:notice] = 'No university selected.'
    end
    redirect_to root_path
  end

  def update_users
    if(params[:users] == nil)

    else
      params[:users].keys.each do |x|
        User.update_status(x)
      end
    end

    redirect_to admin_path
  end

end
