# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    association :card_type
    title "a card"
    desc "..."
    content "..."
  end
end
