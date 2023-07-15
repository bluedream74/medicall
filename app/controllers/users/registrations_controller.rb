class Users::RegistrationsController < Devise::RegistrationsController


  def update
    super do |resource|
      if resource.errors.any?
        Rails.logger.info resource.errors.full_messages.join("\n")
      else
        flash[:notice] = 'アカウント情報を変更しました。' # add this line
      end
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = 'ご登録いただいたメールアドレス宛認証メールを送信しました。ご確認ください。'
    root_path
  end

  def after_update_path_for(resource)
    account_dashboard_path
  end
 
end
