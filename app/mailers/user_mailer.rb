class UserMailer < ApplicationMailer

  def user_activation_email(user)
    @user = user
    mail(to: @user.email, subject: "Account Confirmation")
  end
end
