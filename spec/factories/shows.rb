# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show do
    name "MyString"
    desc "MyString"

    factory :invalid_show do
      name nil
    end
  end
end
