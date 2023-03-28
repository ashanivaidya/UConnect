class ProgramsController < ApplicationController
  def show

  end

  def index
    puts "test"
    puts params[:school]
    puts "test"
    university_id = params[:school]
    university_search_uri = 'https://api.data.gov/ed/collegescorecard/v1/schools.json?id=' + university_id + '&fields=id,school.school_url,school.city,school.state,2015.admissions.test_requirements,2015.admissions.admission_rate.overall,2015.cost.avg_net_price.public,school.name,2013.student.size&api_key=HAm234DRylBdwr9s80X76mTZTDubUE7Zi1lrUSn0'
    university_data_formatted = URI.open(university_search_uri).read
    university_data_parsed = JSON.parse(university_data_formatted)
    university_data = university_data_parsed['results']

    @programs = university_data[0]['2015.programs.cip_4_digit']
    if @programs.nil?
      flash[:notice] = "No area of study programs found for this university."
      redirect_to students_show_path
    end
  end
end