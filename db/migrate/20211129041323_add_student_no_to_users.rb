class AddStudentNoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :student_no, :string, after: :email
    add_column :users, :name, :string, after: :student_no
    add_column :users, :role_flag, :string, default: 0, after: :name
  end
end
