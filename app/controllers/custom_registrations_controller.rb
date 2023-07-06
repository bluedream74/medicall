class CustomRegistrationsController < Devise::RegistrationsController
  layout :resolve_layout

  private

  def resolve_layout
    case action_name
    when 'edit'
      'admin'
    else
      'application' # デフォルトのレイアウト
    end
  end
end
