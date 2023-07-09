class Clinic < ApplicationRecord
  has_many :user_clinics
  has_many :users, through: :user_clinics

  has_many :clinic_customers, dependent: :destroy
  has_many :customers, through: :clinic_customers

  has_many :clinic_hours, dependent: :destroy
  has_many :clinic_closures, dependent: :destroy
end
