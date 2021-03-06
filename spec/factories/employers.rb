FactoryBot.define do
  factory :employer do
    name { Faker::Company.name }
    code { Faker::Code.unique.asin }
  end
end
