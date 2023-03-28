
class Rating < ActiveRecord::Base
  def self.number(application_id)
    num = 0.0;
    Rating.where("student_application_id = '#{application_id}'").each do |rating|
      num = num + 1
    end

    num
  end

  def self.average(application_id)
    size = Rating.number(application_id)
    avg = 0.0
    Rating.where("student_application_id = '#{application_id}'").each do |rating|
      avg = avg + rating.rating
    end
    if size == 0
      0
    else
      avg/size
    end
  end
end

