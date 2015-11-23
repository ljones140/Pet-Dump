FactoryGirl.define do
  factory :pet do
    name 'Trigger'

    trait :with_dump do
      after(:create) { |instance| create(:dump, pet: instance) }
    end

    trait :with_one_daily_dump do
      after(:create) { |instance| create_list(:dump, 10, :once_daily, pet: instance) }
    end

    trait :with_two_daily_dump do
      after(:create) { |instance| create_list(:dump, 20, :two_daily, pet: instance) }
    end

  end

end
