FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'
    password 'testtest'
    password_confirmation 'testtest'

    factory :user_with_pet do
      after(:create) {|instance| create_list(:pet, 1, user: instance) }
    end
  end
end
