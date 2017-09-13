class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    @url = "http://localhost:3000"
    mail(to: @user.email, subject: "Welcome to Fakebook!")
  end
end
