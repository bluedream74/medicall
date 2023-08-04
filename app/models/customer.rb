class Customer < ApplicationRecord
  belongs_to :clinic
  has_many :call_logs, dependent: :destroy

  def list_type=(type)
    self.is_white_list = (type == "is_white_list")
    self.is_black_list = (type == "is_black_list")
  end

  def list_type
    if is_white_list
      "is_white_list"
    elsif is_black_list
      "is_black_list"
    else
      nil
    end
  end
end
