class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
  helper(EmailHelper)
  
  before_action :set_template

  def set_template 
    @tmp = Template.default_template.first
  end
end
