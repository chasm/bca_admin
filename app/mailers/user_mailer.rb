class UserMailer < ActionMailer::Base
  default from: "admin@bridgecityautobrokers.com"
  
  def reset_email(user)
    @user = user
    @user.code = SecureRandom.urlsafe_base64
    @user.expires_at = DateTime.now + 1
    @user.save
    @url  = "http://localhost:3000/reset/#{@user.code}"
    mail :to => @user.email_address,
      :subject => "Reset your credentials for Bridge City Automotive"
  end
end
