class AddForeignKeyToStudents < ActiveRecord::Migration
  def change
    add_foreign_key :students, :users, column: :email_id, primary_key: :email, on_delete: :cascade
  end
end
