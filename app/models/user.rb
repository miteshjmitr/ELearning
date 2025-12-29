class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_secure_password
    
    enum role: { teacher: 1, student: 2, admin: 3 }

    has_many :given_assignments,
           foreign_key: :teacher_id,
           class_name: "Assignment"

    has_many :received_assignments,
           foreign_key: :student_id,
           class_name: "Assignment"

    has_many :submissions, foreign_key: "student_id"


    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
