class User < ApplicationRecord
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  # has_secure_password
end
