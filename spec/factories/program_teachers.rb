FactoryBot.define do
  
  factory :program_teacher do
    program { create(:program) }
    teacher { create(:teacher) }
  end
end