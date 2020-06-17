class Group < ApplicationRecord
  belongs_to :user, required: true
  has_many :time_entries
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  default_scope { order(name: :asc) }
  before_save :downcase_name

  private

  def downcase_name
    self.name = name.downcase
  end
end
