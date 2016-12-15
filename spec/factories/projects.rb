FactoryGirl.define do
  factory :project do
    name Faker::Superhero.name
    description Faker::Hipster.paragraph
    goal Faker::Number.decimal(2)
  end
end
