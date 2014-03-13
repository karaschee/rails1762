# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    count 1
    tagable_id 1
    tagable_type "MyString"
  end
end
