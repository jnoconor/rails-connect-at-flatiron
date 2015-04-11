FactoryGirl.define do
  factory :student do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    twitter {Faker::Internet.url('twitter.com')}
    linkedin {Faker::Internet.url('www.linkedin.com/in')}
    github {Faker::Internet.url('github.com')}
    cohort
  end

end
