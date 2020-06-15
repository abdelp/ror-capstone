class Group < ApplicationRecord
  belongs_to :user, required: true
  has_many :time_entries
  validates :name, presence: true, uniqueness: true
  default_scope { order(name: :asc) }
end
