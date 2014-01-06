# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :volume do
    association :show
    title "MyString"
    desc "MyString"
  end
end
