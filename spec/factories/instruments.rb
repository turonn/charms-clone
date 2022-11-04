FactoryBot.define do
  
  factory :instrument do
    case_id { 'A - 14' }
    instrument { 'trumpet' }
    make { 'Bach' }
    model { 'stradivarious' }
    serial_number { '123bc34' }
    year { 2013 }
    condition { 'excellent' }
    notes { 'this is an excellent horn' }
    program { create(:program) }
  end
end
