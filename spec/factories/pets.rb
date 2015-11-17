FactoryGirl.define do
  factory :pet do
    name 'Trigger'

    trait :with_dump do
      after(:create) { |instance| create(:dump, pet: instance) }
    end

    trait :with_one_daily_dump do
      after(:create) do |instance|
        create(:dump, pet: instance)
      end
    end
  end
end
