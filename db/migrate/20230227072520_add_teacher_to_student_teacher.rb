class AddTeacherToStudentTeacher < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_teachers, :teacher, null: false, foreign_key: true
  end
end
