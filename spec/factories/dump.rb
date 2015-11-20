FactoryGirl.define do
  factory :dump do
    time_went Time.local(2015, 10, 18, 16, 0)

    factory :dump_sequence do
      sequence(:time_went){ |n| n.days.ago }
    end
  end
end
