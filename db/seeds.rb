# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

StudentTeacher.destroy_all
Teacher.destroy_all
Student.destroy_all
School.delete_all

filename = Rails.root.join("db/schools.csv")
puts "Loading products from the csv file: #{filename}"

csv_data = File.read(filename)
data = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

data.each do |s|
  School.create(
    name:       s["name"],
    grades:     s["grades"],
    gender:     s["gender"],
    address:    s["address"],
    latitude:   s["latitude"],
    longitutde: s["longitude"]
  )
end
puts "Created #{School.count} schools"

# #######################################################################################################################################3

filename_students = Rails.root.join("db/students.csv")
puts "Loading products from the csv file: #{filename_students}"

csv_data_students = File.read(filename_students)
students = CSV.parse(csv_data_students, headers: true, encoding: "iso-8859-1")

students.each do |s|
  school = School.find_by(id: s["school"])
  if school && school.valid?
    student = school.students.create(
      firstname: s["firstname"],
      lastname:  s["lastname"],
      grade:     s["grade"],
      gender:    s["gender"],
      email:     s["email"]
    )
    puts "Invalid students #{s['firstname']}" unless student&.valid?
  else
    puts "invalid school #{s['school_id']} for student #{s['firstname']}."
  end
end
puts "Created #{Student.count} students"

########################################################################################################################################

filename_teachers = Rails.root.join("db/teachers.csv")
puts "Loading products from the csv file: #{filename_teachers}"

csv_data_teachers = File.read(filename_teachers)
teachers = CSV.parse(csv_data_teachers, headers: true, encoding: "iso-8859-1")

teachers.each do |s|
  school = School.find_by(id: s["school_id"])
  if school && school.valid?
    teacher = school.teachers.create(
      firstname: s["firstname"],
      lastname:  s["lastname"],
      email:     s["email"]
    )
    puts "Invalid teachers #{s['firstname']}" unless teacher&.valid?
  else
    puts "invalid school #{s['school_id']} for teacher #{s['firstname']}."
  end
end
puts "Created #{Teacher.count} teachers"

###############################################################################################################################
file = Rails.root.join("db/student_teachers.csv")
puts "Loading products from the csv file: #{file}"

csv_data_st = File.read(file)
student_teachers = CSV.parse(csv_data_st, headers: true, encoding: "iso-8859-1")

student_teachers.each do |s|
  StudentTeacher.create(
    student_id: s["student_id"],
    teacher_id: s["teacher_id"]
  )
end
puts "Created #{StudentTeacher.count} student_teacher records"
