module TemplatesHelper
  def use_template_text template
    return template.is_template ? 'Used Template' : 'Use Template'
  end
end
