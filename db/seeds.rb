# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#fixed email seed issue
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Student.create(:first_name => 'sam', :last_name => 'farmer', :age => 20,
#                :email => 'sam@k.com', :phone => 'sam', :address => 'westgate 3hd',
#                :city => 'Iowa city', :state => 'IA', :country => 'USA' )
Education.create(:gpa => 3.3,:college_name=> 'Uiowa',:degree=>'B.S.W.', :student_id =>1)
Score.create(:sat=> 700,:act=> 35, :gre=>333, :toefl=>'',:ielts=>8.5, :student_id=>1)
user = User.create! :name => 'Admin', :email => 'admin@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 2, :status => 'confirmed'
@user = User.create! :name => 'Adam', :email => 'user@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 0, :status => 'confirmed'

# Creating sample student for viewing application
# @student_sample = Student.create(:first_name => 'Mark', :last_name => 'Seymour', :age => 22,
#                :email => 'mark.seymour@gmail.com', :phone => '4257789213', :address => '546 Pennington Cr',
#                :city => 'Sheraton', :state => 'SD', :country => 'USA' )
@student_sample = Student.create(:first_name => 'sam', :last_name => 'farmer', :age => 20,
                                 :email_id => 'sam@k.com', :phone => 'sam', :address => 'westgate 3hd',
                                 :city => 'Iowa city', :state => 'IA', :country => 'USA' )
@student_sample.educations.create(:gpa => 3.71, :college_name => 'University of Wyoming', :degree => 'B.S.', :student_id => 2)
#@student_sample.scores.create(:sat => 1351, :act => 30, :gre => 327, :toefl => 110, :ielts => 8, :student_id => 2)
# @student_sample.student_applications.create(:application_id => 1, :university_name => 'University of Nevada', :program => 'Geology', :degree => 'PhD', :year_start => '2024')
# @student_sample.student_applications.create(:application_id => 2, :university_name => 'University of Rochester', :program => 'Environmental Science', :degree => 'PhD', :year_start => '2024')
@student_sample.student_applications.create(:university_name => 'University of Nevada', :program => 'Geology', :degree => 'PhD', :year_start => '2024')
@application_sample = @student_sample.student_applications.create(:university_name => 'University of Rochester', :program => 'Environmental Science', :degree => 'PhD', :year_start => '2024')

Rating.create(:rating => 5, :user_id => @student_sample.id, :student_application_id => @application_sample.id)