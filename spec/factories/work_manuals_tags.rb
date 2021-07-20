FactoryBot.define do
  factory :work_manuals_tag do
    title   {Faker::Lorem.sentence}
    process {Faker::Lorem.sentence}
    name    {Faker::Lorem.sentence}
  end
end
