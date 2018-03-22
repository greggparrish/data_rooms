# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview
  def mail_preview
    Mailer.welcome_email(User.first)
  end
end
