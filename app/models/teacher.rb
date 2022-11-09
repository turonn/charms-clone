class Teacher < ApplicationRecord
  has_many :program_teachers
  has_many :programs, :through => :program_teachers
  has_many :instruments, :through => :programs

  validates_presence_of :email_address
end