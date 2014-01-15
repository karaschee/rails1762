# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show do
    sequence(:name) { |n| "show#{n}" }
    desc "some description"

    factory :invalid_show do
      name nil
    end
  end
end
