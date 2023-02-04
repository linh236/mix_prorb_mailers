class EmailsController < ApplicationController 
  def index
    @emails = Email.all.order(created_at: :desc)
  end

  def new
    @email = Email.new  
  end

  def show
    @email = Email.find(params[:id])
    @template = Template.default_template.first
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @email).deliver_now
      end 
      redirect_to  emails_path, notice: 'Email was successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def email_params
      params.require(:email).permit(:subject, :body)
    end
end