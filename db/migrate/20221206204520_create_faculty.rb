class CreateFaculty < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email_id
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :country


      t.timestamps null: false
    end
  end
end
