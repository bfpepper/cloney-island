FactoryGirl.define do

  factory :user do
    name "Testy Test Test"
    email
    phone Faker::PhoneNumber.phone_number
    password "password"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

end
