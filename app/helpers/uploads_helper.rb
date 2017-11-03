module UploadsHelper
  def file_preview(file)
    return if file.blank?
    return image_tag(file.thumbnail.url) if file.thumbnail.url

    case file.content_type
    when "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      image_tag("slideshow.jpg")
    when "application/vnd.oasis.opendocument.text",
         "application/msword",
         "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      image_tag("document.jpg")
    else
      image_tag("fallback.jpg")
    end
  end


  def file_name(file)
    File.basename(file.path)
  end
end
