
FactoryGirl.define do
  factory :setting, :class => Refinery::Feedbacks::Setting do
    sequence(:mail_adm) { |n| "refinery#{n}" }
  end
end

