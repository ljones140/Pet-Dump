FactoryGirl.define do
  factory :dump do
    time_went Time.local(2015, 10, 18, 16, 0)

    trait :once_daily do
      sequence(:time_went){ |n| n.days.ago }
    end

    trait :two_daily do
      sequence(:time_went){ |n| (n * 12).hours.ago }
    end

  end

end
