class Customer < ApplicationRecord

  has_many :clinic_customers
  has_many :clinics, through: :clinic_customers
  
end
