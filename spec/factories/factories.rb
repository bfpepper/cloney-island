FactoryGirl.define do

  factory :user do
    name "Testy Test Test"
    email
    phone
    password "password"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :phone do |n|
    "12111#{n}121"
  end


end
