class AddStudentApplications < ActiveRecord::Migration
  def up
    create_table :student_applications do |t|
      t.integer :application_id
      t.string :university_name
      t.string :program
      t.string :degree
      t.string :year_start
      t.string :first_name
      t.string :last_name
      t.string :attended_university_name
      t.string :university_degree
      t.float :gpa
      t.integer :sat
      t.integer :act
      t.integer :gre
      t.integer :toefl
      t.float :ielts
      t.references :student
      t.references :education
      t.references :score
      t.references :rating
      t.string :status, :default => "Pending"
      t.timestamps
    end
  end

  def down
    drop_table :student_applications
  end
end
