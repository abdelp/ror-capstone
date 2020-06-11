class User < ApplicationRecord
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id
  has_many :groups
  validates :name, presence: true, uniqueness: true
  # mount_uploader :gravatar_url, AvatarUploader
end
