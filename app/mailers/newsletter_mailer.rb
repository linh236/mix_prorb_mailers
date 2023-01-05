class NewsletterMailer < ApplicationMailer

  def email(subscriber, email)
    @subscriber = subscriber
    @email = email

    mail to: @subscriber.email, subject: @email.subject
  end

  def template(subscriber, template) 
    @subscriber = subscriber
    @template = template
    
    mail to: @subscriber.email, subject: "Have a new #{@template.name} template for you"
  end
end