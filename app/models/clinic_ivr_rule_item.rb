class ClinicIvrRuleItem < ApplicationRecord
  belongs_to :clinic
  belongs_to :clinic_ivr_rule
  has_ancestry

  enum category: {
    voice_guidance: 0,
    phone_transfer: 1,
    sms: 2,
  }
end
