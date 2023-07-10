class CustomRegistrationsController < Devise::RegistrationsController
  before_action :set_clinic, only: [:edit, :update]
  layout :resolve_layout

  def edit
  end

  def update
  end

  private

  def set_clinic
    @clinic = current_user.clinics.first
  end

  def resolve_layout
    case action_name
    when 'edit'
      'admin'
    else
      'application' # デフォルトのレイアウト
    end
  end
end
