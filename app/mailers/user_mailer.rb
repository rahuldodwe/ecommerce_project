class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def login_notification(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome !')
  end
end
