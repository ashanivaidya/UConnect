class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.float :gpa
      t.string :college_name
      t.string :degree

      t.timestamps null: false
    end
  end
end
