FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'
    password 'testtest'
    password_confirmation 'testtest'

    trait :with_pet do
      email 'user_with_pet@test.com'
      after(:create) { |instance| create(:pet, user: instance) }
    end

    trait :with_dumped_pet do
      after(:create) { |instance| create(:pet, :with_dump, user: instance) }
    end

    trait :with_one_daily_dump_pet do
      after(:create) { |instance| create(:pet, :with_one_daily_dump, user: instance) }
    end
  end
end
