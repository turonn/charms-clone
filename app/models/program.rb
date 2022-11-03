class Program < ActiveRecord::Base
  has_many :program_teachers
  has_many :teachers, :through => :program_teachers
  has_many :instruments, dependent: :destroy
end