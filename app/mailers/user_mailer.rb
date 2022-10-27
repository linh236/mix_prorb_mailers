class UserMailer < ApplicationMailer
  def hello
    @user = params[:user]
    attachments["flower.png"] = File.read("tmp/flower.png")
    mail(to: email_address_with_name(@user.email, @user.name), subject: "Hello #{@user.name}")
  end
end