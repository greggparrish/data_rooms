class Mailer < ApplicationMailer
  include Roadie::Rails::Automatic
  default from: ENV['DR_GMAIL_USER']

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
