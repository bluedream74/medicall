class Schedule < ApplicationRecord
  belongs_to :clinic

  enum day_of_week: { 月: 0, 火: 1, 水: 2, 木: 3, 金: 4, 土: 5, 日: 6 }
  enum session: { 午前: 0, 午後: 1, その他: 2 }
  # enum session: { AM: 0, PM: 1 }
  # enum session: { session1: 0, session2: 1, session3: 2 }

  validates :day_of_week, :session, :start_time, :end_time, presence: true
  validate :end_after_start

  private

    def end_after_start
      return if end_time.blank? || start_time.blank?

      if end_time < start_time
        errors.add(:end_time, "must be after the start time")
      end
    end
end
