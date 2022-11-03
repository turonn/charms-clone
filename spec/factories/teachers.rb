FactoryBot.define do
  
  factory :teacher do
    first_name { 'Michael' }
    last_name { 'Matthews' }
    email_address { 'example@email.com' }
    email_verified { false }
    mobile_phone_number { '123-456-7890' }
    birthday { '20222-11-03'.to_date }
  end
end