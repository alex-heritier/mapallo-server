# frozen_string_literal: true

module FileHelper
  def self.save_base64(filename:, base64:)
    path = "#{Rails.root}/public/assets/#{filename}"
    File.open(path, 'wb') { |f| f.write(Base64.decode64(base64)) }
    puts "FileHelper - saved #{path}"
  end
end
