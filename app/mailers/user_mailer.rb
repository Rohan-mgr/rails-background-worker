class UserMailer < ApplicationMailer
  default from:ENV['SMTP_USERNAME']

  def waiting_email(user)
    @user = user 
    mail(to: @user[:email], subject: "Information about Data Processing")
  end
end
