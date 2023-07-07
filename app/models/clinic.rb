class Clinic < ApplicationRecord
  has_many :user_clinics
  has_many :users, through: :user_clinics
end
