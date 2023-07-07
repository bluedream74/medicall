class Clinic < ApplicationRecord
  has_many :user_clinics
  has_many :users, through: :user_clinics

  has_many :clinic_customers
  has_many :customers, through: :clinic_customers
end
