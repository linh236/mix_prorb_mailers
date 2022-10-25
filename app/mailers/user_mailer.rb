class UserMailer < ApplicationMailer
  def hello
    @user = params[:user]
    mail(to: @user.email, subject: "Hello #{@user.name}")
  end
end
