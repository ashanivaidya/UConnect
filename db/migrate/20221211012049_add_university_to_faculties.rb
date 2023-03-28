class AddUniversityToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :university_name, :string
  end
end
