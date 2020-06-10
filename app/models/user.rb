class User < ApplicationRecord
  has_many :time_entries, inverse_of: 'author', foreign_key: :author_id
  has_many :groups

  def my_transactions

  end
end
