class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
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


# rails generate scaffold student first_name:string last_name:string age:integer email:string phone:integer address:string city:string state:string country:string
