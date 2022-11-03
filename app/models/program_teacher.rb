class ProgramTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :progam
end
