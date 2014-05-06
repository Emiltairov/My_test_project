
FactoryGirl.define do
  factory :feedback, :class => Refinery::Feedbacks::Feedback do
    sequence(:email) { |n| "refinery#{n}" }
  end
end

