class Clinic < ApplicationRecord
  has_many :user_clinics
  has_many :users, through: :user_clinics

  has_many :clinic_customers, dependent: :destroy
  has_many :customers, through: :clinic_customers

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true

  def schedule_info_complete?
    # !self.start_time.nil? && !self.end_time.nil?
    schedules.present?
  end
  
end
