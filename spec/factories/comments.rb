FactoryGirl.define do
  factory :comment do
    comment_body "MyText"
    user nil
    project nil
  end
end
