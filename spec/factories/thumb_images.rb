# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :thumb_image do
    asset "MyString"
    thumb_imageable_id 1
    thumb_imageable_type "MyString"
  end
end
