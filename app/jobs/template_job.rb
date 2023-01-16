class TemplateJob < ApplicationJob
  queue_as :default

  # Method 1
  rescue_from (ActiveRecord::RecordNotFound) do |record|
    p record
  end

  # Method 2
  # retry_on(ActiveRecord::RecordNotFound) do |record|
  #   p record
  # end

  # Method 3
  # discard_on(ActiveRecord::RecordNotFound) do |record|
  #   p record
  # end

  def perform(user)
    "My name is #{user.name}"
  end
end
