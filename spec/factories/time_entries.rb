FactoryBot.define do
  factory :time_entry do
    author_id { '' }
    name { 'MyString' }
    amount { 1 }
    group { nil }
  end
end
