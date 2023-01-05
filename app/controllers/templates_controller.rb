class TemplatesController < ApplicationController
  def index
    @templates = Template.all.order(created_at: :desc)
  end

  def new
    @template = Template.new
  end

  def show
    @template = Template.find(params[:id])
  end

  def create 
    @template = Template.new(template_params)
    if @template.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.template(subscriber, @template).deliver_now
      end 
      redirect_to  templates_path, notice: 'template was successfully'
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

    def template_params
      params.require(:template).permit(:name, :body)
    end
end
