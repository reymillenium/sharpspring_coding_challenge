FactoryBot.define do

  factory :note do
    title   { Faker::Lorem.word }
    body    { Faker::Lorem.sentence }
    user    { build :user }
  end

end