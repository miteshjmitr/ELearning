class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :student, class_name: "User"

  validates :student_id, uniqueness: { scope: :assignment_id }

end
