class Customer < ApplicationRecord

  has_many :clinic_customers
  has_many :clinics, through: :clinic_customers

  def list_type=(type)
    self.is_white_list = (type == 'is_white_list')
    self.is_black_list = (type == 'is_black_list')
  end

  def list_type
    if is_white_list
      'is_white_list'
    elsif is_black_list
      'is_black_list'
    else
      nil
    end
  end
  
end
