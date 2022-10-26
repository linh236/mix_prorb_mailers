class UserMailer < ApplicationMailer
  def hello
    @user = params[:user]
    mail(to: email_address_with_name(@user.email, @user.name), subject: "Hello #{@user.name}")
  end
end