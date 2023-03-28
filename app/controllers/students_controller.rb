
class StudentsController < ApplicationController
  before_action :check_student, except: [:index]

  def check_student
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.student?)
  end

  def index

    order = params[:order]
    ordering = 'first_name desc'
    @students = Student.all

    if order == 'age'
      ordering = 'age ASC'
      @students = Student.all.reorder(ordering)
    elsif order == 'first_name'
      ordering = 'first_name desc'
      @students = Student.all.reorder(ordering)
    elsif order == 'gpa'
      ordering = 'educations.gpa desc'
      @students = Student.all.includes(:educations).reorder(ordering)
    elsif order == 'sat'
      ordering = 'scores.sat desc'
      @students = Student.all.includes(:scores).reorder(ordering)
    elsif order == 'act'
      ordering = 'scores.act desc'
      @students = Student.all.includes(:scores).reorder(ordering)
    end

    #@students = Student.all.reorder(ordering)

  end

  def show
    @student = Student.find_by_email_id(current_user.email) #this will have to come from the session after login
    if params[:search_box] == nil || params[:search_box] == ''
      @universities = [ Hash['school.name' => 'Enter a valid university name to search.', '2015.admissions.admission_rate.overall' => ' ', '2015.admissions.test_requirements' => ''] ]
    else
      response = StudentsController.search_collegeapi(params[:search_box])
      json = JSON.parse(response)
      @universities = json['results']
    end

    students = Student.all.includes(:educations).order('educations.gpa desc')
    i = 1.0
    students.each do |s|
      if s.id == @student.id
        break
      end
      i = i+1
    end
    @gpa_rank = i
    @total = students.length

    students = Student.all.includes(:score).reorder('scores.act desc')
    i = 1.0
    students.each do |s|
      if s.id == @student.id
        break
      end
      i = i+1
    end

    @act_rank = i

  end

  def self.search_collegeapi(terms)
    string = 'https://api.data.gov/ed/collegescorecard/v1/schools.json?school.name='+ terms + '&fields=id,school.school_url,school.city,school.state,2015.admissions.test_requirements,2015.admissions.admission_rate.overall,2015.cost.avg_net_price.public,school.name,2013.student.size&api_key=HAm234DRylBdwr9s80X76mTZTDubUE7Zi1lrUSn0'
    #URI.open("https://api.data.gov/ed/collegescorecard/v1/schools.json?school.name=#{terms}&fields=id,school.school_url,school.city,school.state,2015.admissions.test_requirements,2015.admissions.admission_rate.overall,2015.cost.avg_net_price.public,school.name,2013.student.size&api_key=HAm234DRylBdwr9s80X76mTZTDubUE7Zi1lrUSn0").read
    URI.open(string).read
  end

  def details
    if !params[:id].nil?
      @student = Student.find(params[:id])
    else
      flash[:notice] == 'Not Found.'
      redirect_to root_path
    end
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student details added successfully!' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
    # @student = Student.create!(:first_name => params[:first_name]['first_name'], :last_name => params[:last_name]['last_name'], :age => params[:age]['age'], :email => params[:email]['email'], :phone => params[:phone]['phone'], :address => params[:address]['address'], :city => params[:city]['city'], :state => params[:state]['state'], :country => params[:country]['country'])
    # flash[:notice] = "#{@student.first_name} was added."
    # redirect_to students_index_path
  end

  def new
    @student= Student.new
    @student.build_score
    @student.educations.build
  end

  def edit
    @student = Student.find_by email_id:current_user.email
  end

  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Your profile is successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :age, :phone, :address, :city, :state, :country, score_attributes: [:id, :sat, :act, :gre, :toefl, :ielts], educations_attributes: [:id, :gpa, :college_name, :degree]).merge!({:email_id => current_user.email})
    end
end
