class University < ActiveRecord::Base
  has_many :student_applications
  has_many :programs
end
