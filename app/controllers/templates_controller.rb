class TemplatesController < ApplicationController
  before_action :set_params, only: [:show, :update, :destroy, :use_template, :edit]
  def index
    @templates = Template.all.order(created_at: :desc)
  end

  def new
    @template = Template.new
  end

  def show
  end

  def edit 

  end

  def create 
    @template = Template.new(template_params)
    if @template.save
      # Subscriber.all.each do |subscriber|
      #   NewsletterMailer.template(subscriber, @template).deliver_now
      # end 
      redirect_to  templates_path, notice: 'Template was successfully'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def use_template
    Template.update_all(is_template: false)
    if @template.update(is_template: set_is_template)

    else
      redirect_to  templates_path, status: :unprocessable_entity
    end
  end

  def update
    if @template.update(template_params)
      redirect_to  templates_path, notice: 'Template was updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @template.destroy
  end

  private

    def template_params
      params.require(:template).permit(:name, :body, :header=> {}, :footer=> {})
    end

    def set_params 
      @template = Template.find(params[:id])
    end

    def set_is_template 
      params[:is_template] == "true" ? false : true
    end
end
