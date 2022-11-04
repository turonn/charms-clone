class Program < ApplicationRecord
  has_many :program_teachers
  has_many :teachers, :through => :program_teachers
  has_many :instruments, dependent: :destroy
end