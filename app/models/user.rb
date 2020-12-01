require 'open-uri'

class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # before_create :add_to_list

  has_one_attached :avatar
  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.skip_confirmation!
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name

      url = auth.info.image

      begin
        file = File.open('user_avatar.jpeg', 'wb') do |file|
          file << open(url).read
        end
        user.avatar.attach(io: File.open(file), filename: 'user_avatar.jpeg')
      rescue Exception => e
        p e.message, e.backtrace.inspect
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  # def add_to_list
  #   list_id = '3931f5bbf9'
  #   @gb = Gibbon::Request.new
  #   subscribe = @gb.lists(list_id).members.create(body: {
  #     email_address: email,
  #     status: 'subscribed',
  #     double_optin: false
  #   })
  # end
end
