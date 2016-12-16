FactoryGirl.define do
  factory :project do
    title
    description Faker::Hipster.paragraph
    goal Faker::Number.decimal(2)
    category
  end
  sequence :title do |n|
    "tile#{n}"
  end

end
