class StudentApplicationsController < ApplicationController
  before_action :confirm_student, only: :edit
  before_action :confirm_faculty, only: :faculty_index
  before_action :check_faculty

  def check_faculty
    if current_user.faculty? and current_user.status == 'Unconfirmed'
      flash[:notice] = 'You need to be approved by the Admin before viewing and approving applications! Contact admin@gmail.com to get your account approved.'
      redirect_to(root_path)
    end
  end



  def confirm_student
    if !current_user.student?
      redirect_to root_path
    end
  end

  def confirm_faculty
    if !current_user.faculty?
      redirect_to root_path
    end
  end
  def show
    application_id = params[:id]
    @student_application = StudentApplication.find(application_id)
    @student = Student.find(StudentApplication.find(application_id).student_id)

    @ratings = Rating.where("student_application_id = '#{application_id}'")
    @avg_ratings = 0
    @num_ratings = 0
    @ratings.each do |rating|
      @avg_ratings = @avg_ratings + rating.rating
      @num_ratings = @num_ratings + 1
    end
    if(@num_ratings == 0)
      @avg_ratings = "No ratings yet"
      @num_ratings = "No ratings yet"
    else
      @avg_ratings = @avg_ratings / @num_ratings
    end
  end

  def index
    @student_applications = StudentApplication.where("student_id = #{(Student.find_by_email_id(current_user.email).id)}")
    # Student.where("id = #{student_application.student_id}").first
  end

  def faculty_index
    if !StudentApplication.where("university_name = '#{Faculty.where("email_id = '#{current_user.email}'").first.university_name}'").nil?
      @student_applications = StudentApplication.where("university_name = '#{Faculty.where("email_id = '#{current_user.email}'").first.university_name}'")
    else
      @student_applications = {}
    end
    
    order = params[:order]

    if order == 'age'
      ordering = 'age ASC'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'first_name'
      ordering = 'first_name desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'gpa'
      ordering = 'gpa desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'sat'
      ordering = 'sat desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'act'
      ordering = 'act desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'gre'
      ordering = 'gre desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'toefl'
      ordering = 'toefl desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    elsif order == 'ielts'
      ordering = 'ielts desc'
      @student_applications = StudentApplication.all.reorder(ordering)
    end
  end

  def new
    @university_program = params[:program]
  end

  def edit
    application_id = params[:id]
    @student_application = StudentApplication.find(application_id)
  end

  def update
    application_id = params[:id]
    @student_application = StudentApplication.find(application_id)
    student_application_update = ActionController::Parameters.new(params[:student_application]).permit(:application_id, :university_name, :program, :degree, :year_start, :first_name, :last_name, :attended_university_name, :university_degree, :gpa, :sat, :act, :gre, :toefl, :ielts)
    @student_application.update_attributes!(student_application_update)
    redirect_to edit_student_application_path(@student_application)
  end

  def destroy
    application_id = params[:id]
    @student_application = StudentApplication.find(application_id)
    @student_application.destroy
    redirect_to student_applications_path
  end

  def save_application
    @student_application = StudentApplication.new(params.require(:student_application).permit(:application_id, :university_name, :program, :degree, :year_start, :first_name, :last_name, :attended_university_name, :university_degree, :gpa, :sat, :act, :gre, :toefl, :ielts))

    @student_application.university_name = params[:program][:university_name]
    @student_application.program = params[:program][:program]
    @student_application.degree = params[:program][:degree]
    @student_application.year_start = params[:program][:year_start]

    @student_application.student = Student.find_by_email_id(current_user.email)
    @student_application.score = Score.create(:act => @student_application.act, :gre => @student_application.gre, :toefl => @student_application.toefl, :ielts => @student_application.ielts)
    @student_application.education = Education.create(:gpa => @student_application.gpa, :college_name => @student_application.attended_university_name, :degree => @student_application.university_degree)

    @student_application.application_id = StudentApplication.count + 1
    @student_application.save

    redirect_to student_applications_path
  end

  def update_status
    StudentApplication.find(params[:application_id]).update_column('status', params[:Application][:status])
    redirect_to student_application_path(StudentApplication.find(params[:application_id]))
  end
end