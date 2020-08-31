FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'abcd1234' }
    password_confirmation { password }
    first_name            { '大村' }
    last_name             { '直樹' }
    first_name_kana       { 'オオムラ' }
    last_name_kana        { 'ナオキ' }
    birth_date            { '1992-01-23' }
  end
end
