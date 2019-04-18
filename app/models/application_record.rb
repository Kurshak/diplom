# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def resize_image
    filename = image.filename.to_s
    puts attachment_path = "#{Dir.tmpdir}/#{image.filename}"
    File.open(attachment_path, 'wb') do |file|
      file.write(image.download)
      file.close
    end
    mini_image = MiniMagick::Image.open(attachment_path)
    mini_image.resize '300!x200!'
    mini_image.write attachment_path
    image.attach(io: File.open(attachment_path), filename: filename, content_type: 'image/jpg')
  end
end
