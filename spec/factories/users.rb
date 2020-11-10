FactoryBot.define do
  factory :user do
    #transient do
      #person { Gimei.name }
    #end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    first_name            { "日本" }
    second_name           { "太郎" }   #{ person.last.kanji }
    first_name_k          { "ニホン" }   #{ person.first.katakana }
    second_name_k         { "タロウ" }   #{ person.last.katakana }
    birthday              { Faker::Date.backward }
  end
end
