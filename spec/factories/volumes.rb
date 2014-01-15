# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :volume do
    association :show
    sequence(:title) { |n| "volume vol.#{n}" }
    sequence(:resource) { "http://test.com/test.mp3" }
    desc "desc..."
  end
end
