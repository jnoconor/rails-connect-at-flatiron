FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid {Faker::Number.number(10)}
  end

end
