class AddStudentRefToScores < ActiveRecord::Migration
  def change
    add_reference :scores, :student, index: true, foreign_key: true
  end
end
