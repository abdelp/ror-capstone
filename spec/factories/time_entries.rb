FactoryBot.define do
  factory :time_entry do
    name { 'MyString' }
    start_time { DateTime.iso8601('2020-06-15T05:07:00') }
    end_time { DateTime.iso8601('2020-06-15T05:08:00') }
    group_id { 1 }
  end
end
