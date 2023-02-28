class Teacher < ApplicationRecord
  belongs_to :school
  has_many :student_teachers
  has_many :students

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :school_id, presence: true
end
