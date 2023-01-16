class Template < ApplicationRecord

  scope :default_template, -> { where(is_template: true) }

end
