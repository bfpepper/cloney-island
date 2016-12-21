FactoryGirl.define do

  factory :category do |n|
    name
    factory :category_with_projects do
      projects { create_list(:project, 2) }
    end
  end

  sequence :name do |n|
    "Name#{n}"
  end

end
