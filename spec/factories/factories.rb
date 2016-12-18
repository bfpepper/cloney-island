FactoryGirl.define do

  factory :user do
    name "#{Faker::Name.name}"
    email
    phone
    password "password"
    factory :user_with_projects do
      projects {create_list(:project, 2)}
    end
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :phone do |n|
    "12111#{n}121"
  end


end
