class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    super do |resource|

      flash[:notice] = "アカウントの確認が完了しました。ログインしてください。"  
    end
  end
end
