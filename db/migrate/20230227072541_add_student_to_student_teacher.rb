class AddStudentToStudentTeacher < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_teachers, :student, null: false, foreign_key: true
  end
end
