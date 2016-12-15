FactoryGirl.define do
  factory :category do
    name
  end

  sequence :name do |n|
    "user#{n}"
  end
end
