FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '0511oh' }
    password_confirmation { '0511oh' }
    first_name            { '日本' }
    second_name           { '太郎' }
    first_name_k          { 'ニホン' }
    second_name_k         { 'タロウ' }
    birthday              { Faker::Date.backward }
  end
end
