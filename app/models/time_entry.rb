class TimeEntry < ApplicationRecord
  belongs_to :group, required: false # optional
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :name, presence: true
  validates :start_time, presence: true
  default_scope { order(name: :desc) }
end
