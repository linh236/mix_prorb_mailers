class CustomMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "custom_mailer"
  helper(EmailHelper)
  
  before_action :set_template

  def set_template 
    @tmp = Template.default_template.first
  end
end
