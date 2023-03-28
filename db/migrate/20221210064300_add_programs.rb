class AddPrograms < ActiveRecord::Migration
  def up
    create_table :programs do |t|
      t.string :university_name
      t.string :program_name
      t.string :department
      t.string :degree
      t.references :university
      t.timestamps
    end
  end

  def down
    drop_table :programs
  end
end
