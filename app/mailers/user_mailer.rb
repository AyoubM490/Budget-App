class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #
  def user_created
    @greeting = "Hi"

    mail(
      from: "support@corsego.com",
      to: User.first.email,
      cc: User.all.pluck(:email),
      bcc: "secret@corsego.com",
      subject: "New User Created",
    )
  end
end
