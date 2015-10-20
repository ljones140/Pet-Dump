FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'
    password 'testtest'
    password_confirmation 'testtest'

    trait :with_pet do
      email 'user_with_pet@test.com'
      after(:create) { |instance| create(:pet, user: instance) }
    end
  end
end
