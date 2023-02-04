class Template < ApplicationRecord

  scope :default_template, -> { where(is_template: true) }

  before_create :all_template_false
  after_create :template_true

  private 

    def all_template_false
      Template.update_all(is_template: false)
    end

    def template_true
      self.update(is_template: true)
    end

end
