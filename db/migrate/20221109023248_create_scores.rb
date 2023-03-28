class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :sat
      t.integer :act
      t.integer :gre
      t.integer :toefl
      t.float :ielts

      t.timestamps null: false
    end
  end
end
