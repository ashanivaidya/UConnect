class StudentApplication < ActiveRecord::Base
  belongs_to :student
  belongs_to :score
  belongs_to :education
end
