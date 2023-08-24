class ClinicIvrRuleItem < ApplicationRecord
  belongs_to :clinic
  belongs_to :clinic_ivr_rule
  has_ancestry
end
