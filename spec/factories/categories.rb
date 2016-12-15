FactoryGirl.define do
  factory :category do
    name
  end

  sequence :name do |n|
    "category #{n}"
  end
end
