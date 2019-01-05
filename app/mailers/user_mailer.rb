class UserMailer < ApplicationMailer
  def welcome_email
    @user ="kailaskhrd@gmail.com"
    @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Welcome to My Awesome Site',body: "test")
  end
end
