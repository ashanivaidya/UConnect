
class CreateRatings < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.integer :rating
      t.references :user
      t.references :student_application
      t.string :comment
      t.timestamps null: false
    end
  end

  def down
    drop_table :ratings
  end
end

