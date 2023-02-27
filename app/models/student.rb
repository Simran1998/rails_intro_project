class Student < ApplicationRecord
  belongs_to :school
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :school_id, presence: true
end
