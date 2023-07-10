class Clinic < ApplicationRecord
  has_many :user_clinics
  has_many :users, through: :user_clinics

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true
  
end
