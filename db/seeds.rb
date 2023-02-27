# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

School.delete_all
StudentTeacher.destroy_all
Teacher.destroy_all
Student.destroy_all

filename = Rails.root.join("db/schools.csv")
puts "Loading products from the csv file: #{filename}"

csv_data = File.read(filename)
data = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

data.each do |s|
  School.create(
    name:    s["name"],
    grades:  s["grades"],
    gender:  s["gender"],
    address: s["address"]
  )
end
puts "Created #{School.count} schools"


filename_students = Rails.root.join("db/students.csv")
puts "Loading products from the csv file: #{filename_students}"

csv_data_students = File.read(filename_students)
students = CSV.parse(csv_data_students, headers: true, encoding: "iso-8859-1")

products.each do |p|
  category = Category.find_or_create_by(name: p["category"])
  if category && category.valid?
    product = category.products.create(
      title:          p["name"],
      price:          p["price"],
      description:    p["description"],
      stock_quantity: p["stock quantity"]
    )
    puts "Invalid product #{p['name']}" unless product&.valid?
  else
    puts "invalid category #{p['category']} for product #{p['name']}."
  end
