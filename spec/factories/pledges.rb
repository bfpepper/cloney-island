FactoryGirl.define do
  factory :pledge do
    user
    project
    amount_given 1
  end
end
