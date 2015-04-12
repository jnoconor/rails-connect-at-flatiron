FactoryGirl.define do
  factory :student do
    full_name {Faker::Name.name}
    twitter {Faker::Internet.url('twitter.com')}
    linkedin {Faker::Internet.url('www.linkedin.com/in')}
    github {Faker::Internet.url('github.com')}
    cohort
  end

end
