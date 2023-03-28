class Education < ActiveRecord::Base
  belongs_to :student
  has_many :student_applications
end
