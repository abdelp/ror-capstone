class TimeEntry < ApplicationRecord
  belongs_to :group, required: false # optional
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  default_scope { order(name: :desc) }
  validate :no_overlaping

  private

  def no_overlaping
    return unless !start_time.nil? && end_time.nil? && start_time < end_time

    errors.add(:end_time, "end_time can't be equal or less than start_time")
  end
end
