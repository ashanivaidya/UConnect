class AddUniversities < ActiveRecord::Migration
  def up
    create_table :universities do |t|
      t.integer :university_id
      t.string :university_name
      t.integer :enrollment
      t.float :acceptance_rate
      t.integer :average_cost
      t.string :standardized_test_required
      t.string :city
      t.string :state
      t.timestamps
    end
  end

  def down
    drop_table :universities
  end
end