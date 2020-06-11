class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  default_scope { order(name: :asc) }
end
