class Clinic < ApplicationRecord
  has_many :user_clinics, dependent: :destroy
  has_many :users, through: :user_clinics
  has_many :customers, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :clinic_programs, dependent: :destroy
  has_one :ivr_rule, dependent: :destroy, class_name: "ClinicIvrRule"

  accepts_nested_attributes_for :schedules, allow_destroy: true

  def schedule_info_complete?
    schedules.present?
  end
end
