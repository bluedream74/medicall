class ClinicCustomer < ApplicationRecord
  belongs_to :clinic
  belongs_to :customer, dependent: :destroy
end
