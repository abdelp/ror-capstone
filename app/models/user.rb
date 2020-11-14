class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, presence: true, length: { minimum: 6 }
end
