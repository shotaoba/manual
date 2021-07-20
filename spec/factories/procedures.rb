FactoryBot.define do
  factory :procedure do
    description         {Faker::Lorem.sentence}
    point               {Faker::Lorem.sentence}
    association :work_manual
    association :user

  end
end
