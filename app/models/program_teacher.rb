class ProgramTeacher < ApplicationRecord
  belongs_to :program
  belongs_to :teacher

  validates_presence_of :program, :teacher
end
