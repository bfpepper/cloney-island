FactoryGirl.define do
  factory :project do
    name
    description Faker::Hipster.paragraph
    goal Faker::Number.decimal(2)
    category
  end
end
