FactoryGirl.define do
  factory :pet do
    name 'Trigger'

    trait :with_dump do
     after(:create) { |instance| create(:dump, pet: instance) }
    end 
  end
end
