class Student < ApplicationRecord
  paginates_per 10
  belongs_to :school
  has_many :student_teachers
  has_many :teachers

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :school_id, presence: true
end
