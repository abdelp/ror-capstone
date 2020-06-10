class TimeEntry < ApplicationRecord
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
