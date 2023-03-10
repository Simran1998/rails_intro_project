class School < ApplicationRecord
  has_many :students
  has_many :teachers
  has_many :student_teachers
  validates :name, presence: true
end
