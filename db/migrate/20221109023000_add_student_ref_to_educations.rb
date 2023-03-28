class AddStudentRefToEducations < ActiveRecord::Migration
  def change
    add_reference :educations, :student, index: true, foreign_key: true
  end
end
