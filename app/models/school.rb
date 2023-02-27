class School < ApplicationRecord
  has_many:students
  has_many:teachers
  validates :name, presence: true
end
