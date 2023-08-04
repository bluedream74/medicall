class CallLog < ApplicationRecord
  belongs_to :clinic
  belongs_to :customer
end
