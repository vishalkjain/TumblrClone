class AuthMailer < ActionMailer::Base
  default from: "admin@example.com"

  def signup_email(user)
      mail(
        :to => user.email,
        :subject => 'Thanks for signing up'
      )
  end
end
