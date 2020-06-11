class User < ApplicationRecord
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :full_name, presence: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
