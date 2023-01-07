module EmailHelper
  def email_image_tag(image)
    return Rails.root.join("app/assets/images/#{image}")
  end
end
