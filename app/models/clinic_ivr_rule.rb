class ClinicIvrRule < ApplicationRecord
  belongs_to :clinic
  has_many :items, dependent: :destroy, class_name: "ClinicIvrRuleItem"
end
