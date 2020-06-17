class TimeEntry < ApplicationRecord
  belongs_to :group, required: false
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', required: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  default_scope { order(created_at: :desc) }
  validate :no_overlaping

  private

  def no_overlaping
    return if !start_time.nil? && !end_time.nil? && start_time < end_time

    errors.add(:end_time, "end time can't be equal or less than start_time")
  end
end
